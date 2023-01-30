import requests


class MattermostPlugin:
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

        if self.user != "" and self.channel != "":
            self.send_message_with_bot_to_channel()
            self.send_message_with_bot_to_user()
        elif self.channel == "" and self.user != "":
            self.send_message_with_bot_to_user()
        elif self.user == "" and self.channel != "":
            self.send_message_with_bot_to_channel()
        else:
            ValueError("No input in user or channel.")

    def get_bot_id(self):
        """Request to find the bot ID with the bot name"""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }
        response = requests.get(
            f"{self.url}/api/v4/bots",
            headers=headers,
            json={"per_page": 1},
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

    def get_channel_id(self):
        """Request to find the channel ID with the bot name"""
        headers = {
            "Authorization": f"Bearer {self.access_token}",
        }

        # generate a channel_id
        response = requests.get(
            f"{self.url}/api/v4/channels",
            headers=headers,
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
        requests.post(f"{self.url}/api/v4/posts", headers=headers, json=data, timeout=5)


MattermostPlugin(
    "localhost:8065",
    "tt6uoi71gfbntm68nf46kidnrh",
    "bot",
    "isodis",
    "hannes_test",
    "test message mit herz"
)
