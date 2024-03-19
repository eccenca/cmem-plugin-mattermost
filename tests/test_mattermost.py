"""Plugin tests."""
import uuid

import pytest
from cmem_plugin_base.dataintegration.entity import Entities, Entity, EntityPath, EntitySchema
from cmem_plugin_base.dataintegration.parameter.password import Password

from cmem_plugin_mattermost.workflow.mattermost_plugin import (
    MattermostPlugin,
    MattermostSearch,
    get_dataset,
    get_request_handler,
    header,
)
from tests.utils import (
    TestExecutionContext,
    TestPluginContext,
    TestSystemContext,
    needs_cmem,
)

pytest_plugins = ["docker_compose"]
access_token = Password(encrypted_value="ah85ckhk6ib6zqqjh7i7j16hra", system=TestSystemContext())
bot_name = "plugin-test"
user = "cmempy-developer"
channel = "Town Square"
message = "test"
url = "http://localhost:8065"

sample_data_full = {
    "user": user,
    "channel": channel,
    "message": message,
}

sample_data_empty = {
    "user": "",
    "channel": "",
    "message": "",
}


def get_entities(sample_data: dict[str, str]) -> Entities:
    """Get entities object with lead columns"""
    projections = list(sample_data)
    entities = []
    entity_uri = f"urn:uuid:{uuid.uuid4()!s}"
    values = [[sample_data[_]] for _ in projections]
    entities.append(Entity(uri=entity_uri, values=values))
    paths = [EntityPath(path=projection) for projection in projections]

    schema = EntitySchema(
        type_uri="https://example.org/vocab/mattermost",
        paths=paths,
    )
    return Entities(entities=entities, schema=schema)


@needs_cmem
def test_execute_with_inputs_and_static(mattermost_service: str) -> None:
    """Test executing with inputs and static"""
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        user,
        "",
        message,
    ).execute([get_entities(sample_data_full)], TestExecutionContext())


def test_execute_error(mattermost_service: str) -> None:
    """Test execute error with out user or channel"""
    with pytest.raises(ValueError, match="No recipient."):
        MattermostPlugin(
            mattermost_service,
            access_token,
            bot_name,
            "",
            "",
            "",
        ).execute([get_entities(sample_data_empty)], TestExecutionContext())


@needs_cmem
def test_execute_with_inputs_only(mattermost_service: str) -> None:
    """Test execute with inputs only"""
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        "",
        "",
        "",
    ).execute([get_entities(sample_data_full)], TestExecutionContext())


@needs_cmem
def test_execute_with_no_inputs(mattermost_service: str) -> None:
    """Test execute with no inputs"""
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        "",
        "",
        "",
    ).execute([], TestExecutionContext())


def test_execute_with_empty_message_error(mattermost_service: str) -> None:
    """Test execute with empty message"""
    with pytest.raises(ValueError, match="No recipient."):
        MattermostPlugin(
            mattermost_service,
            access_token,
            bot_name,
            user,
            channel,
            "",
        ).send_message_to_provided_parameter()


def test_send_message_with_bot_to_user(mattermost_service: str) -> None:
    """Test send message to user with bot"""
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        user,
        "",
        "Single user test message",
    ).send_message_with_bot_to_user()


def test_send_message_with_bot_to_channel(mattermost_service: str) -> None:
    """Test sending message to channel with bot"""
    MattermostPlugin(
        mattermost_service, access_token, bot_name, "", channel, "Channel test message"
    ).send_message_with_bot_to_channel()


def test_send_message_with_bot_to_channel_error(mattermost_service: str) -> None:
    """Test send_message_with_bot_to_channel error"""
    wrong_channel = "wrong_channel_name"
    with pytest.raises(ValueError, match=f"Channel {wrong_channel} do not exist."):
        MattermostPlugin(
            mattermost_service,
            access_token,
            bot_name,
            "",
            wrong_channel,
            "Channel test message",
        ).send_message_with_bot_to_channel()


def test_get_user_id(mattermost_service: str) -> None:
    """Test get_user_id method"""
    assert (
        MattermostPlugin(mattermost_service, access_token, bot_name, user, channel, message).get_id(
            user
        )
        == "hruniqwds7gg5bcm5fmn931iih"
    )


def test_get_user_id_error(mattermost_service: str) -> None:
    """Test get_user_id error"""
    user_empty = ""
    with pytest.raises(ValueError, match="ID not found, check  parameter."):
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user_empty, channel, message
        ).get_id(user_empty)

    user_wrong = "wrong_user"
    with pytest.raises(ValueError, match="ID not found, check  parameter."):
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user_wrong, channel, message
        ).get_id(user_empty)


def test_get_channel_id(mattermost_service: str) -> None:
    """Test getting channel"""
    assert (
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel, message
        ).get_channel_id()
        == "qzzdms4tyb8zzbo5e8b8r56mtc"
    )


def test_get_channel_id_error(mattermost_service: str) -> None:
    """Test get channel id error"""
    channel_wrong = ""
    with pytest.raises(ValueError, match="No channel name was provided."):
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel_wrong, message
        ).get_channel_id()


def test_get_bot_id_error(mattermost_service: str) -> None:
    """Test get_bot_id error"""
    bot_name_wrong = "wrong_bot"
    with pytest.raises(ValueError, match=bot_name_wrong):
        MattermostPlugin(
            mattermost_service, access_token, bot_name_wrong, user, channel, message
        ).get_id(bot_name_wrong)


def test_header() -> None:
    """Test header"""
    result = header(access_token)
    assert result == {
        "Authorization": f"Bearer {access_token.decrypt()}",
        "Content-Type": "application/json",
    }


def test_get_request_handler(mattermost_service: str) -> None:
    """Test get request handler"""
    _ = mattermost_service
    result = get_request_handler(url, "users", access_token)
    assert result.ok


def test_send_message_to_provided_parameter_error(mattermost_service: str) -> None:
    """Test send message to"""
    with pytest.raises(ValueError, match="No recipient."):
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel, ""
        ).send_message_to_provided_parameter()


def test_send_message_to_provided_parameter(mattermost_service: str) -> None:
    """Test send message to provided chanel or user"""
    MattermostPlugin(
        mattermost_service, access_token, bot_name, user, channel, message
    ).send_message_to_provided_parameter()
    MattermostPlugin(
        mattermost_service, access_token, bot_name, "", channel, message
    ).send_message_to_provided_parameter()
    MattermostPlugin(
        mattermost_service, access_token, bot_name, user, "", message
    ).send_message_to_provided_parameter()


def test_get_dataset(mattermost_service: str) -> None:
    """Test get_dataset"""
    _ = mattermost_service
    result = get_dataset(url, "users", access_token, [user])
    assert result[0]["username"] == f"{user}"


@needs_cmem
def test_autocomplete_error() -> None:
    """Test autocomplete_error"""
    with pytest.raises(ValueError, match="Input url and access token first."):
        MattermostSearch("users", "username").autocomplete(["cmem"], [], TestPluginContext())


@needs_cmem
def test_autocomplete() -> None:
    """Test autocomplete"""
    MattermostSearch("users", "username").autocomplete(
        query_terms=["cmem"],
        depend_on_parameter_values=[url, access_token],
        context=TestPluginContext(),
    )

    MattermostSearch("users", "username").autocomplete(
        query_terms=[], depend_on_parameter_values=[url, access_token], context=TestPluginContext()
    )
