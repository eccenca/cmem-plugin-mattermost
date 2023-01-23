"""A Mattermost integration Plugin"""
import requests
from cmem_plugin_base.dataintegration.description import Plugin, PluginParameter
from cmem_plugin_base.dataintegration.plugins import WorkflowPlugin


@Plugin(
    label="automated messages (mattermost-integration)",
    description="Sends automated messages in Mattermost channels or direct to users ",
    documentation="""This Plugin sends messages via
    Mattermost bot/bots to channel or users.

The Plugin can sends automated messages to different
server, teams, channel, user via different bots only by the name of
the team, channel, user.

- 'url' = URL for the Mattermost API
- 'access_token' = The access token of the bot
_ 'bot_name' = the bot name you want to post the message with
_ 'user_name' = the username you want to get the message
_ 'channel_name' = channel name you want to post the message in
_ 'team_name' = the team name of the channel you want to post the message in
_ 'message' = the message you want to send
""",


    parameters=[
        PluginParameter(
            name="url",
            label="URL",
            description="The url of the mattermost server you want to use.",
            default_value="https://chat.eccenca.com",
        ),
        PluginParameter(
            name="access_token",
            label="Access Token",
            description="The access token of the bot which"
            " was given when the bot was created.",
            default_value="Need to fill",
        ),
        PluginParameter(
            name="bot_name",
            label="Bot ID",
            description="The name of the bot you will send with.",
            default_value="Need to be filled for user message.",
        ),
        PluginParameter(
            name="user_name",
            label="Username",
            description="The user name you want to get the message.",
            default_value="Need to be filled for user message.",
        ),
        PluginParameter(
            name="channel_name",
            label="Channel name",
            description="The name of the channel you want to get the message.",
            default_value="Need to be filled for channel message.",
        ),
        PluginParameter(
            name="team_name",
            label="Team name",
            description="The name of the team where the channel is in ",
            default_value="Need to be filled for user message.",
        ),
        PluginParameter(
            name="message",
            label="Message",
            description="Words, which together will be a message :-)",
            default_value=None,
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
        user_name: str,
        channel_name: str,
        team_name: str,
        message: str,
    ) -> None:

        self.url = url
        self.access_token = access_token
        self.bot_name = bot_name
        self.user_name = user_name
        self.channel_name = channel_name
        self.team_name = team_name
        self.message = message

        send_message_with_bot_to_user(self)
        send_message_with_bot_to_channel(self)


def send_message_with_bot_to_user(self):
    """sends messages from bot to user."""

    headers = {
        "Authorization": f"Bearer {self.access_token}",
    }
    # Request to find the bot ID with the bot name
    response = requests.post(
        f"{self.url}/api/v4/users/search",
        headers=headers,
        json={"term": self.bot_name},
        timeout=5,
    )
    if response.status_code != 201:
        bot_data = response.json()[0]
        bot_id = bot_data["id"]

        # Request to find the user ID with the username
        response = requests.post(
            f"{self.url}/api/v4/users/search",
            headers=headers,
            json={"term": self.user_name},
            timeout=5,
        )
        if response.status_code != 201:
            user_data = response.json()[0]
            user_id = user_data["id"]

            # payload for json to generate a direct channel with post request
            data = [bot_id, user_id]
            # post request to generate the direct channel
            response = requests.post(
                f"{self.url}/api/v4/channels/direct",
                headers=headers,
                json=data,
                timeout=5,
            )

            channel_id = response.json()["id"]

            # payload for the json to generate the message
            payload = {"channel_id": channel_id, "message": self.message}

            # post request to send the message
            requests.post(
                f"{self.url}/api/v4/posts", headers=headers, json=payload, timeout=5
            )


def send_message_with_bot_to_channel(self):
    """sends messages from bot to channel."""

    headers = {
        "Authorization": f"Bearer {self.access_token}",
    }

    # generate a channel_id
    response = requests.get(
        f"{self.url}/api/v4/teams/name/{self.team_name}"
        f"/channels/name/{self.channel_name}",
        headers=headers,
        timeout=5,
    )
    if response.status_code != 201:
        channel_id = response.json()["id"]
        # payload
        data = {"channel_id": channel_id, "message": self.message}
        # Post request for the message
        requests.post(f"{self.url}/api/v4/posts", headers=headers, json=data, timeout=5)
