"""Plugin tests."""
import unittest

from cmem_plugin_mattermost.workflow.mattermost_plugin import MattermostPlugin


url = "http://localhost:8065"
access_token = "ah85ckhk6ib6zqqjh7i7j16hra"
bot_name = "plugin-test"
user = "cmempy-developer"
channel = "town-square"
message = "test"
cpm = MattermostPlugin(
    url,
    access_token,
    bot_name,
    user,
    channel,
    message
)


# TODO: test-send message to a user
class TestMattermostPlugin(unittest.TestCase):
    def test_send_message_with_bot_to_user(self):

        cpm.send_message_with_bot_to_user()

    def test_send_message_with_bot_to_channel(self):

        cpm.send_message_with_bot_to_channel()

    def test_get_user_id_list(self):
        self.assertEqual(cpm.get_user_id_list(), ["hruniqwds7gg5bcm5fmn931iih"])

    def test_get_channel_id(self):
        self.assertEqual(cpm.get_channel_id(), "qzzdms4tyb8zzbo5e8b8r56mtc")
# TODO: test-send message to user multiple users

# TODO: test-send message to a channel

# TODO: test-userid, channelid methods
