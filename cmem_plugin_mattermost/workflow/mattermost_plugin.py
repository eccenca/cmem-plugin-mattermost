"""A Mattermost integration Plugin"""
from typing import Sequence

import requests
from cmem_plugin_base.dataintegration.context import ExecutionContext, ExecutionReport
from cmem_plugin_base.dataintegration.description import Plugin, PluginParameter
from cmem_plugin_base.dataintegration.entity import Entities
from cmem_plugin_base.dataintegration.parameter.multiline import (
    MultilineStringParameterType,
)
from cmem_plugin_base.dataintegration.plugins import WorkflowPlugin


@Plugin(
    label="Mattermost Plugin",
    plugin_id="cmem_plugin_mattermost",
    description="Sends automated messages in Mattermost"
    " via bot to channels or direct to users ",
    documentation="""This Plugin sends messages via
    Mattermost bot/bots to channel or users.

The Plugin can sends automated messages to different
server, teams, channel, user via different bots only by the name of
the team, channel, user.

- 'url' = URL for the Mattermost API
- 'access_token' = The access token of the bot
- 'bot_name' = the bot name you want to post the message with
- 'user_name' = the username you want to get the message
- 'channel_name' = channel name you want to post the message in
- 'message' = the message you want to send
""",
    parameters=[
        PluginParameter(
            name="url",
            label="URL",
            description="The url of the mattermost server you want to use.",
        ),
        PluginParameter(
            name="access_token",
            label="Access Token",
            description="The access token of the bot,"
            "which was given when the bot was created.",
        ),
        PluginParameter(
            name="bot_name",
            label="Bot name",
            description="The name or id of the bot you will send with.",
        ),
        PluginParameter(
            name="user",
            label="User",
            description="The full name, username,"
            " nickname or email of the user you want to get the message."
            " If you want to send your message to multiple"
            " user separate them with a comma ','.",
            default_value="",
        ),
        PluginParameter(
            name="channel",
            label="Channel",
            description="The name or display name of the channel"
            " you want to get the message.",
            default_value="",
        ),
        PluginParameter(
            name="message",
            label="Message",
            description="Words, which together will be a message :-)",
            param_type=MultilineStringParameterType(),
            default_value="",
        ),
    ],
)
class MattermostPlugin(WorkflowPlugin):
    """A Mattermost integration Plugin with static messaging"""

    # pylint: disable=R0913
    def __init__(
        self,
        url: str,
        access_token: str,
        bot_name: str,
        user: str,
        channel: str,
        message: str,
    ) -> None:
        self.url = url
        self.access_token = access_token
        self.bot_name = bot_name
        self.user = user
        self.channel = channel
        self.message = message

    def execute(self, inputs: Sequence[Entities], context: ExecutionContext) -> None:
        self.log.info("Mattermost plugin started.")
        # fix message with every start, could be used at creating of the workflow item
        if not self.user and not self.channel and not inputs:
            pass
        if self.user or self.channel:
            self.send_message_to_provided_parameter()
        if inputs:
            entities_counter = 0
            channel_counter = 0
            channels = []
            users = []
            user_counter = 0
            # Entity/ies
            for item in inputs:
                column_names = [ep.path for ep in item.schema.paths]
                # columns of given Entity
                for entity in item.entities:
                    entities_counter += 1
                    i = 0
                    # row of given Entity
                    for _ in column_names:
                        if len(entity.values[i]) > 0:
                            param_value = entity.values[i][0]
                        else:
                            param_value = ""
                        # TODO: extract to a message class or similar
                        # Advantage: more self contained, better structure, ...
                        if _ == "user":
                            self.user = param_value
                        elif _ == "channel":
                            self.channel = param_value
                        elif _ == "message":
                            self.message = param_value
                        i += 1
                        list_channel = format_string_into_list(self.channel)
                        list_user = format_string_into_list(self.user)
                        channels.append(list_channel)
                        users.append(list_user)
                        channel_counter += len(list_channel)
                        user_counter += len(list_user)

                    self.send_message_to_provided_parameter()

            context.report.update(
                ExecutionReport(
                    entity_count=entities_counter,
                    operation="wait",
                    operation_desc="entities received",
                    summary=[
                        (
                            f"No.{channel_counter} of channel who get a message."
                            f" No.{user_counter} of user who get a direct message"
                            f" No.{user_counter + channel_counter} of messages send",
                        ),
                        (
                            f"List of the channels: {channels}",
                            f"List of the user: {users}",
                        ),
                    ],
                )
            )

    def header(self):
        """Request Header"""
        header = {
            "Authorization": f"Bearer {self.access_token}",
            "Content-Type": "application/json",
        }
        return header

    def get_request_handler(self, url_extend):
        """Handle get requests"""
        response = requests.get(
            f"{self.url}/api/v4/{url_extend}",
            headers=self.header(),
            timeout=2,
        )
        return response

    def post_request_handler(self, url_expand, payload):
        """Handle post requests"""
        response = requests.post(
            f"{self.url}/api/v4/{url_expand}",
            headers=self.header(),
            json=payload,
            timeout=2,
        )
        return response

    def get_bot_id(self):
        """Request to find the bot ID with the bot name"""
        response = self.get_request_handler("bots")
        bot_id = ""
        bot_name = self.bot_name
        list_bot_entities = response.json()
        for _ in list_bot_entities:
            if bot_name in (
                _["username"],
                _["display_name"],
            ):
                bot_id = _["user_id"]
        if bot_id != "":
            return bot_id
        raise ValueError("Bot ID not found, check bot_name parameter.")

    def get_user_id_list(self):
        """Request to find the user ID with the username.
        Returns a list of id`s not a string."""
        if not self.user:
            raise ValueError("No user name was provided.")
        list_user_data = self.collect_all_pages_from_mattermost_api("users")
        list_usernames_provided = format_string_into_list(self.user)
        list_user_id = []
        list_usernames_for_error_handling = []
        for _ in list_usernames_provided:
            username = _.lstrip().rstrip().lower()
            list_usernames_for_error_handling.append(username)
            for _ in list_user_data:
                if username in (
                    _["username"].lower(),
                    _["email"].lower(),
                    _["nickname"].lower(),
                    (_["first_name"].lower() + " " + _["last_name"].lower()),
                ):
                    list_user_id.append(_["id"])
        if len(list_usernames_provided) == len(list_user_id):
            return list_user_id
        list_user_exist = []
        for user_id in list_user_id:
            for _ in list_user_data:
                if user_id == _["id"]:
                    list_user_exist.extend(
                        [
                            _["username"].lower(),
                            _["email"].lower(),
                            _["nickname"].lower(),
                            (_["first_name"].lower() + " " + _["last_name"].lower()),
                        ]
                    )
        list_diff = [
            elem
            for elem in list_usernames_for_error_handling
            if elem not in list_user_exist
        ]
        raise ValueError(f"User{', '.join(list_diff)} do not exist.")

    def send_message_with_bot_to_user(self):
        """sends messages from bot to one or more users."""
        list_user_id = self.get_user_id_list()
        bot_id = self.get_bot_id()
        for _ in list_user_id:
            # payload for json to generate a direct channel with post request
            data = [bot_id, _]
            # post request to generate the direct channel
            response = self.post_request_handler("channels/direct", data)
            channel_id = response.json()["id"]
            # payload for the json to generate the message
            payload = {"channel_id": channel_id, "message": self.message}
            # post request to send the message
            self.post_request_handler("posts", payload)

    def get_channel_id(self):
        """Request to find the channel ID with the bot name"""
        if not self.channel:
            raise ValueError("No channel name was provided.")
        list_channel_data = self.collect_all_pages_from_mattermost_api("channels")
        list_channel_names_provided = format_string_into_list(self.channel)
        list_channel_id = []
        list_channel_names_for_error_handling = []
        for _ in list_channel_names_provided:
            channel_name = _.lstrip().rstrip().lower()
            list_channel_names_for_error_handling.append(channel_name)
            for _ in list_channel_data:
                if channel_name in (
                    _["name"].lower(),
                    _["display_name"].lower(),
                ):
                    list_channel_id.append(_["id"])
        if len(list_channel_names_provided) == len(list_channel_id):
            return list_channel_id
        list_channel_exist = []
        for channel_id in list_channel_id:
            for _ in list_channel_data:
                if channel_id == _["id"]:
                    list_channel_exist.extend(
                        [
                            _["name"].lower(),
                            _["display_name"].lower(),
                        ]
                    )
        list_diff = [
            elem
            for elem in list_channel_names_for_error_handling
            if elem not in list_channel_exist
        ]
        raise ValueError(f"Channel{', '.join(list_diff)} do not exist.")

    def send_message_with_bot_to_channel(self) -> None:
        """sends messages from bot to channel."""
        list_channel_id = self.get_channel_id()
        for _ in list_channel_id:
            # payload for the json to generate the message
            payload = {"channel_id": _, "message": self.message}
            # Post request for the message
            self.post_request_handler("posts", payload)

    def send_message_to_provided_parameter(self) -> None:
        """will test if the message is sending to user or channel or both"""
        if self.message:
            if self.user and self.channel:
                self.send_message_with_bot_to_channel()
                self.send_message_with_bot_to_user()
            elif self.user and not self.channel:
                self.send_message_with_bot_to_user()
            elif self.channel and not self.user:
                self.send_message_with_bot_to_channel()
        else:
            raise ValueError("Empty message.")

    def collect_all_pages_from_mattermost_api(self, api_parameter):
        """Collects multiple pages in one list of
        the Mattermost api when the data is split up."""
        i = 0
        user_data_list = []
        while True:
            response = self.get_request_handler(
                f"{api_parameter}?page={i}&per_page=200"
            )
            i += 1
            list_user_entities = response.json()
            if list_user_entities:
                user_data_list.extend(list_user_entities)
            else:
                break
        return user_data_list


def format_string_into_list(string_to_formate):
    """Formate a string to List with using a comma as seperator
    and removing empty values."""
    result = list(filter(None, string_to_formate.split(sep=",")))
    return result
