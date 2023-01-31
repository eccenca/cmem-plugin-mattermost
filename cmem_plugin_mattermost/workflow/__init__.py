"""A Mattermost integration Plugin"""
import json
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
- 'team_name' = the team name of the channel you want to post the message in
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
            label="Username",
            description="The full name, username,"
            " nickname or email of the user you want to get the message."
            " If you want to send your message to multiple"
            " user separate them with a semicolon ';'.",
            default_value="",
        ),
        PluginParameter(
            name="channel",
            label="Channel name",
            description="The name or id of the channel you want to get the message.",
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
        self.log.info("Mattermost Plugin Started")

        entities_counter = 0
        value_counter = 0
        for item in inputs:
            for entity in item.entities:
                entities_counter += 1
                self.user = ""
                self.channel = ""
                self.message = ""
                for _ in entity.values:
                    value_counter += 1
                    if item.schema.type_uri == "user":
                        self.user = _
                    elif item.schema.type_uri == "channel":
                        self.channel = _
                    elif item.schema.type_uri == "message":
                        self.message = _
                if self.user != "" and self.channel != "":
                    self.send_message_with_bot_to_channel()
                    self.send_message_with_bot_to_user()
                elif self.channel == "" and self.user != "":
                    self.send_message_with_bot_to_user()
                elif self.user == "" and self.channel != "":
                    self.send_message_with_bot_to_channel()
                else:
                    self.send_message_with_bot_to_channel()
                    self.send_message_with_bot_to_user()
        context.report.update(
            ExecutionReport(
                entity_count=entities_counter,
                operation="wait",
                operation_desc="entities received",
                summary=[
                    ("No. of entities", f"{entities_counter}"),
                    ("No. of values", f"{value_counter}"),
                ],
            )
        )

    def get_bot_id(self):
        """Request to find the bot ID with the bot name"""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }
        response = requests.get(
            f"{self.url}/api/v4/bots",
            headers=headers,
            data="",
            timeout=5,
        )

        bot_id = str
        list_bot_entities = response.json()
        for _ in list_bot_entities:
            if self.bot_name in (
                _["username"],
                _["display_name"],
            ):
                bot_id = _["user_id"]
                break
        return bot_id

    def get_user_id_list(self) -> list:
        """Request to find the user ID with the username.
        Returns a list of id`s not a string."""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }
        response = requests.get(
            f"{self.url}/api/v4/users?per_page=200",
            headers=headers,
            data="",
            timeout=20,
        )
        list_userentities = response.json()
        list_username = self.user.split(sep=";")
        user_id = []
        for _ in list_username:
            username = _.lstrip()
            if username == "":
                ValueError("No User was insert.")
                break
            for _ in list_userentities:
                if username in (
                    _["username"],
                    _["email"],
                    _["nickname"],
                    (_["first_name"] + " " + _["last_name"]),
                ):
                    user_id.append(_["id"])
        return user_id

    def send_message_with_bot_to_user(self) -> None:
        """sends messages from bot to one or more users."""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }
        list_user_id = self.get_user_id_list()
        bot_id = self.get_bot_id()
        for _ in list_user_id:
            # payload for json to generate a direct channel with post request
            data = [bot_id, _]
            # post request to generate the direct channel
            response = requests.post(
                f"{self.url}/api/v4/channels/direct",
                headers=headers,
                data=data,
                timeout=5,
            )

            channel_id = response.json()["id"]

            # payload for the json to generate the message
            payload = {"channel_id": channel_id, "message": self.message}

            # post request to send the message
            requests.post(
                f"{self.url}/api/v4/posts",
                headers=headers,
                data=json.dumps(payload),
                timeout=5,
            )

    def get_channel_id(self):
        """Request to find the channel ID with the bot name"""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }

        # generate a channel_id
        response = requests.get(
            f"{self.url}/api/v4/channels",
            headers=headers,
            data="",
            timeout=5,
        )
        list_channel = response.json()
        channel_id = str
        for _ in list_channel:
            if self.channel in (
                _["display_name"],
                _["name"],
            ):
                channel_id = _["id"]
                break
        return channel_id

    def send_message_with_bot_to_channel(self) -> None:
        """sends messages from bot to channel."""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }
        channel_id = self.get_channel_id()
        # payload
        data = {"channel_id": channel_id, "message": self.message}
        # Post request for the message
        requests.post(
            f"{self.url}/api/v4/posts",
            headers=headers,
            data=json.dumps(data),
            timeout=5,
        )
