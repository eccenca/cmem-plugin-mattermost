"""Plugin tests."""
import pytest
import requests
from cmem_plugin_base.dataintegration.parameter.password import Password

from cmem_plugin_mattermost.workflow.mattermost_plugin import MattermostPlugin
from tests.utils import TestSystemContext

pytest_plugins = ["docker_compose"]
access_token = Password(encrypted_value="ah85ckhk6ib6zqqjh7i7j16hra",
                        system=TestSystemContext())
bot_name = "plugin-test"
user = "cmempy-developer, user0example, user1@example.com, User Example2, userex3"
channel = "town-square"
message = "test"
url = "http://localhost:8065"


def test_execute_with_empty_message_error(mattermost_service):
    with pytest.raises(ValueError):
        MattermostPlugin(
            mattermost_service,
            access_token,
            bot_name,
            user,
            channel,
            "",
        ).send_message_to_provided_parameter()


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
        "Multiple user test message",
    ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_multiple_user_error(mattermost_service):
    with pytest.raises(ValueError):
        wrong_users = (
            "cmempy-developer, user0example, "
            "wrong_user1, user1@example.com,"
            " User Example2, userex3, wrong_user2, wrong_user3"
        )
        MattermostPlugin(
            mattermost_service,
            access_token,
            bot_name,
            wrong_users,
            "",
            message,
        ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_channel(mattermost_service):
    MattermostPlugin(
        mattermost_service, access_token, bot_name, "", channel, "Channel test message"
    ).send_message_with_bot_to_channel()


def test_send_message_with_bot_to_channel_error(mattermost_service):
    with pytest.raises(ValueError):
        wrong_channel = "wrong_channel_name"
        MattermostPlugin(
            mattermost_service,
            access_token,
            bot_name,
            "",
            wrong_channel,
            "Channel test message",
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
    user_with_closing_comma = (
        "cmempy-developer, user0example," " user1@example.com, User Example2, userex3,"
    )
    assert MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        user_with_closing_comma,
        channel,
        message,
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
    assert MattermostPlugin(
        mattermost_service, access_token, bot_name, user, channel, message
    ).get_channel_id() == ["qzzdms4tyb8zzbo5e8b8r56mtc"]


def test_get_channel_id_error(mattermost_service):
    with pytest.raises(ValueError):
        channel_wrong = ""
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel_wrong, message
        ).get_channel_id()


def test_header(mattermost_service):
    result = {
        "Authorization": f"Bearer {access_token.encrypted_value}",
        "Content-Type": "application/json",
    }
    assert result == {
        "Authorization": "Bearer ah85ckhk6ib6zqqjh7i7j16hra",
        "Content-Type": "application/json",
    }


def test_get_request_handler_users_is_ok(mattermost_service):
    result = requests.get(
        f"{url}/api/v4/users",
        headers=MattermostPlugin.header(
            MattermostPlugin(
                mattermost_service,
                access_token,
                bot_name,
                user,
                channel,
                message,
            )
        ),
        timeout=2,
    )
    assert result.ok


def test_send_message_to_provided_parameter_error(mattermost_service):
    with pytest.raises(ValueError):
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel, ""
        ).send_message_to_provided_parameter()


def test_send_message_to_provided_parameter(mattermost_service):
    MattermostPlugin(
        mattermost_service, access_token, bot_name, user, channel, message
    ).send_message_to_provided_parameter()
    MattermostPlugin(
        mattermost_service, access_token, bot_name, "", channel, message
    ).send_message_to_provided_parameter()
    MattermostPlugin(
        mattermost_service, access_token, bot_name, user, "", message
    ).send_message_to_provided_parameter()
