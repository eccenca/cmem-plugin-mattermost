"""Plugin tests."""

from cmem_plugin_mattermost.workflow.mattermost_plugin import MattermostPlugin

pytest_plugins = ["docker_compose"]


url = "http://localhost:8065"
access_token = "ah85ckhk6ib6zqqjh7i7j16hra"
bot_name = "plugin-test"
user = "cmempy-developer, user0example, user1@example.com, User Example2, userex3"
channel = "town-square"
message = "test"


def test_send_message_with_bot_to_user(homepage):
    waite_request = homepage
    MattermostPlugin(waite_request,
                     access_token,
                     bot_name,
                     "cmempy-developer",
                     "",
                     "Single user test message"
                     ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_multiple_user(homepage):
    waite_request = homepage
    MattermostPlugin(waite_request,
                     access_token,
                     bot_name,
                     user,
                     "",
                     "Multiple user test message"
                     ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_channel(homepage):
    waite_request = homepage
    MattermostPlugin(waite_request,
                     access_token,
                     bot_name,
                     "",
                     channel,
                     "Channel test message"
                     ).send_message_with_bot_to_channel()


def test_get_user_id_list(homepage):
    waite_request = homepage
    assert(MattermostPlugin(
        waite_request,
        access_token,
        bot_name,
        user,
        channel,
        message
    ).get_user_id_list() == ["hruniqwds7gg5bcm5fmn931iih",
                                              "r3qsjphq97fatecdtye9kmeijw",
                                              "36itfo66b7dyxc9x9nec4pssoc",
                                              "z85twbta8b8bpe3qaf7n3iecwa",
                                              "3j4wossgfirburd63ftd5mq16c"])


def test_get_channel_id(homepage):
    waite_request = homepage
    assert(MattermostPlugin(
        waite_request,
        access_token,
        bot_name,
        user,
        channel,
        message
    ).get_channel_id() == "qzzdms4tyb8zzbo5e8b8r56mtc")
