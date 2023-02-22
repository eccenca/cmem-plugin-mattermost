"""Plugin tests."""
import pytest

from cmem_plugin_mattermost.workflow.mattermost_plugin import MattermostPlugin

pytest_plugins = ["docker_compose"]
access_token = "ah85ckhk6ib6zqqjh7i7j16hra"
bot_name = "plugin-test"
user = "cmempy-developer, user0example, user1@example.com, User Example2, userex3"
channel = "town-square"
message = "test"


def test_send_message_with_bot_to_user(mattermost_service):
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        "cmempy-developer",
        "",
        "Single user test message",
    ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_multiple_user(mattermost_service):
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        user,
        "",
        "Multiple user test message"
    ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_channel(mattermost_service):
    MattermostPlugin(
        mattermost_service, access_token, bot_name, "", channel, "Channel test message"
    ).send_message_with_bot_to_channel()


def test_get_user_id_list(mattermost_service):
    assert MattermostPlugin(
        mattermost_service, access_token, bot_name, user, channel, message
    ).get_user_id_list() == [
        "hruniqwds7gg5bcm5fmn931iih",
        "r3qsjphq97fatecdtye9kmeijw",
        "36itfo66b7dyxc9x9nec4pssoc",
        "z85twbta8b8bpe3qaf7n3iecwa",
        "3j4wossgfirburd63ftd5mq16c",
    ]


def test_get_user_id_list_with_closing_comma(mattermost_service):
    user_with_closing_comma = "cmempy-developer, user0example," \
                              " user1@example.com, User Example2, userex3,"
    assert MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        user_with_closing_comma,
        channel,
        message
    ).get_user_id_list() == [
        "hruniqwds7gg5bcm5fmn931iih",
        "r3qsjphq97fatecdtye9kmeijw",
        "36itfo66b7dyxc9x9nec4pssoc",
        "z85twbta8b8bpe3qaf7n3iecwa",
        "3j4wossgfirburd63ftd5mq16c",
    ]


def test_get_user_id_list_error(mattermost_service):
    with pytest.raises(ValueError):
        user_empty = ""
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user_empty, channel, message
        ).get_user_id_list()


def test_get_channel_id(mattermost_service):
    assert (
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel, message
        ).get_channel_id()
        == "qzzdms4tyb8zzbo5e8b8r56mtc"
    )
