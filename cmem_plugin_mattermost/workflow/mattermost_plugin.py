"""A Mattermost integration Plugin"""
import os
from typing import Sequence, Any
import requests
from cmem_plugin_base.dataintegration.context import (
    ExecutionContext,
    ExecutionReport,
    PluginContext
)
from cmem_plugin_base.dataintegration.description import Plugin, PluginParameter
from cmem_plugin_base.dataintegration.entity import Entities
from cmem_plugin_base.dataintegration.parameter.multiline import (
    MultilineStringParameterType,
)
from cmem_plugin_base.dataintegration.parameter.password import Password
from cmem_plugin_base.dataintegration.plugins import WorkflowPlugin
from cmem_plugin_base.dataintegration.types import Autocompletion, StringParameterType


def set_env(url: str, access_token: str):
    """Set Environment"""

    # Set environment variables
    os.environ["MATTERMOST_URL"] = url
    os.environ["MATTERMOST_ACCESS_TOKEN"] = access_token


def header(access_token: Password):
    """Request Header"""
    api_header = {
        "Authorization": f"Bearer {access_token.decrypt()}",
        "Content-Type": "application/json",
    }
    return api_header


def get_request_handler(url: str,
                        url_extend: str,
                        access_token: Password):
    """Handle get requests"""
    response = requests.get(
        f"{url}/api/v4/{url_extend}",
        headers=header(access_token),
        timeout=2,
    )
    return response


def collect_all_pages_from_mattermost_api(url: str,
                                          url_extend: str,
                                          access_token: Password):
    """Collects multiple pages in one list of
    the Mattermost api when the data is split up."""
    i = 0
    user_data_list = []
    while True:
        response = get_request_handler(url,
                                       f"{url_extend}?page={i}&per_page=200",
                                       access_token
                                       )
        i += 1
        list_user_entities = response.json()
        if list_user_entities:
            user_data_list.extend(list_user_entities)
        else:
            break
    return user_data_list


def get_dataset(url: str,
                url_expand: str,
                access_token: Password,
                query_terms: list[str]):
    """create a list of usernames"""
    term = ""
    payload = {"term": term.join(query_terms), }
    response = requests.post(
        f"{url}/api/v4/{url_expand}",
        headers=header(access_token),
        json=payload,
        timeout=2,
    )
    return response.json()


class MattermostSearchUser(StringParameterType):
    """Mattermost Search Type"""

    autocompletion_depends_on_parameters: list[str] = ["url", "access_token"]

    # auto complete for values
    allow_only_autocompleted_values: bool = True
    # auto complete for labels
    autocomplete_value_with_labels: bool = True

    def autocomplete(
        self,
        query_terms: list[str],
        depend_on_parameter_values: list[Any],
        context: PluginContext,
    ) -> list[Autocompletion]:
        if not depend_on_parameter_values:
            raise ValueError("Input url and access token first.")
        result = []
        if len(query_terms) != 0:
            datasets = get_dataset(depend_on_parameter_values[0],
                                   "users/search",
                                   depend_on_parameter_values[1],
                                   query_terms
                                   )
            for username in datasets:
                result.append(
                    Autocompletion(
                        value=f"{username['username']}",
                        label=f"{username['username']}",
                    )
                )
            result.sort(key=lambda x: x.label)  # type: ignore
            return result
        if len(query_terms) == 0:
            value = "Message"
            label = "Enter a letter to get a list of users."
            result.append(Autocompletion(value=value, label=f"{label}"))
        result.sort(key=lambda x: x.label)  # type: ignore
        return result


class MattermostSearchChannels(StringParameterType):
    """Mattermost Search Type"""

    autocompletion_depends_on_parameters: list[str] = ["url", "access_token"]

    # auto complete for values
    allow_only_autocompleted_values: bool = True
    # auto complete for labels
    autocomplete_value_with_labels: bool = True

    def autocomplete(
        self,
        query_terms: list[str],
        depend_on_parameter_values: list[Any],
        context: PluginContext,
    ) -> list[Autocompletion]:
        if not depend_on_parameter_values:
            raise ValueError("Input url and access token first.")
        result = []
        if len(query_terms) != 0:
            datasets = get_dataset(depend_on_parameter_values[0],
                                   "channels/search",
                                   depend_on_parameter_values[1],
                                   query_terms
                                   )
            for channel_name in datasets:
                result.append(
                    Autocompletion(
                        value=f"{channel_name['display_name']}",
                        label=f"{channel_name['display_name']}",
                    )
                )
            result.sort(key=lambda x: x.label)  # type: ignore
            return result
        if len(query_terms) == 0:
            value = "Message"
            label = "Enter a letter to get a list of channels."
            result.append(Autocompletion(value=value, label=f"{label}"))
        result.sort(key=lambda x: x.label)  # type: ignore
        return result


@Plugin(
    label="Mattermost Plugin",
    plugin_id="cmem_plugin_mattermost",
    description="Sends automated messages in Mattermost"
    " via bot to channels or direct to users ",
    documentation="""This Plugin sends messages via
    Mattermost bot to channel(s) or user(s).

The plugin can send messages to users and/or channels
on your Mattermost server through your preset bot.

<h2>Workflow mode</h2>

The plugin can send a static message to the pre-configured parameters.
This message will be sent to the defined user and/or
channel every time the workflow is executed.

For dynamic messages, the input of the parameters
user, channel, message is done by an input via entities.
""",
    parameters=[
        PluginParameter(
            name="url",
            label="URL",
            description="url of mattermost server.",
        ),
        PluginParameter(
            name="access_token",
            label="Access Token",
            description="access token of the bot",
        ),
        PluginParameter(
            name="bot_name",
            label="Bot name",
            description="name or display name",
        ),
        PluginParameter(
            name="user",
            label="User",
            description="user who get the message",
            param_type=MattermostSearchUser(),
            default_value="",
        ),
        PluginParameter(
            name="channel",
            label="Channel",
            description="The name or display name"
            " If you want to send your message to multiple"
            " channel separate them with a comma.",
            param_type=MattermostSearchChannels(),
            default_value="",
        ),
        PluginParameter(
            name="message",
            label="Message",
            description="max 16383 character",
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
        access_token: Password,
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
            channels: list = []
            users: list = []
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
                        # Advantage: more self-contained, better structure, ...
                        if _ == "user":
                            self.user = param_value
                            user_counter += 1
                            users.extend(self.user)
                        elif _ == "channel":
                            self.channel = param_value
                            channels.extend(self.channel)
                            channel_counter += 1
                        elif _ == "message":
                            self.message = param_value
                        i += 1
                    self.send_message_to_provided_parameter()
            users = list(dict.fromkeys(users))
            channels = list(dict.fromkeys(channels))
            context.report.update(
                ExecutionReport(
                    entity_count=entities_counter,
                    operation="wait",
                    operation_desc="entities received",
                    summary=[
                        ("No. of messages send:", f"{user_counter + channel_counter}"),
                        ("No. of direct messages", f"{user_counter}"),
                        ("No. of channel messages", f"{channel_counter}"),
                        ("Channels that received a message", f"{', '.join(channels)}"),
                        ("Users who received a message", f"{', '.join(users)}"),
                    ],
                )
            )

    def post_request_handler(self, url_expand, payload):
        """Handle post requests"""
        response = requests.post(
            f"{self.url}/api/v4/{url_expand}",
            headers=header(self.access_token),
            json=payload,
            timeout=2,
        )
        return response

    def get_bot_id(self):
        """Request to find the bot ID with the bot name"""
        response = get_request_handler(self.url, "bots", self.access_token)
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

    def get_user_id(self):
        """Request to find the user ID with the username.
        Returns a list of id`s not a string."""
        if not self.user:
            raise ValueError("No user name was provided.")
        list_user_data = collect_all_pages_from_mattermost_api(
            self.url,
            "users",
            self.access_token)
        for _ in list_user_data:
            if self.user in (_["username"]):
                user_id = _["id"]
                return user_id
        raise ValueError(f"User{self.user} do not exist.")

    def send_message_with_bot_to_user(self):
        """sends messages from bot to one or more users."""
        user_id = self.get_user_id()
        bot_id = self.get_bot_id()
        # payload for json to generate a direct channel with post request
        data = [bot_id, user_id]
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
        list_channel_data = collect_all_pages_from_mattermost_api(
            self.url,
            "channels",
            self.access_token
        )
        for _ in list_channel_data:
            if self.channel in _["display_name"]:
                channel_id = _["id"]
                return channel_id
        raise ValueError(f"Channel {self.channel} do not exist.")

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


def format_string_into_list(string_to_formate):
    """Formate a string to List with using a comma as seperator
    and removing empty values."""
    result = list(filter(None, string_to_formate.split(sep=",")))
    return result
