"""Plugin tests."""
import uuid

import pytest
import requests
from cmem_plugin_base.dataintegration.entity import (
    EntitySchema,
    EntityPath,
    Entity,
    Entities
)
from cmem_plugin_base.dataintegration.parameter.password import Password

from cmem_plugin_mattermost.workflow.mattermost_plugin import (
    MattermostPlugin,
    header,
    get_dataset,
    MattermostSearch
)
from tests.utils import TestSystemContext, TestExecutionContext, TestPluginContext

pytest_plugins = ["docker_compose"]
access_token = Password(encrypted_value="ah85ckhk6ib6zqqjh7i7j16hra",
                        system=TestSystemContext())
bot_name = "plugin-test"
user = "cmempy-developer"
channel = "Town Square"
message = "test"
url = "http://localhost:8065"

SAMPLE_DATA = {
    "user": f"{user}",
    "channel": f"{channel}",
    "message": f"{message}",
}


def get_entities(data) -> Entities:
    """get entities object with lead columns"""
    projections = list(data)
    entities = []
    entity_uri = f"urn:uuid:{str(uuid.uuid4())}"
    values = [[data[_]] for _ in projections]
    entities.append(Entity(uri=entity_uri, values=values))
    paths = [EntityPath(path=projection) for projection in projections]

    schema = EntitySchema(
        type_uri="https://example.org/vocab/mattermost",
        paths=paths,
    )
    return Entities(entities=entities, schema=schema)


def test_execute_with_inputs_and_static(mattermost_service):
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        user,
        "",
        message,
    ).execute([get_entities(SAMPLE_DATA)], TestExecutionContext())


def test_execute_with_inputs_only(mattermost_service):
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        "",
        "",
        "",
    ).execute([get_entities(SAMPLE_DATA)], TestExecutionContext())


def test_execute_with_no_inputs(mattermost_service):
    MattermostPlugin(
        mattermost_service,
        access_token,
        bot_name,
        "",
        "",
        "",
    ).execute([], TestExecutionContext())


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
        user,
        "",
        "Single user test message",
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


def test_get_user_id(mattermost_service):
    assert MattermostPlugin(
        mattermost_service, access_token, bot_name, user, channel, message
    ).get_user_id() == "hruniqwds7gg5bcm5fmn931iih"


def test_get_user_id_error(mattermost_service):
    with pytest.raises(ValueError):
        user_empty = ""
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user_empty, channel, message
        ).get_user_id()
    with pytest.raises(ValueError):
        user_empty = "wrong_user"
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user_empty, channel, message
        ).get_user_id()


def test_get_channel_id(mattermost_service):
    assert MattermostPlugin(
        mattermost_service, access_token, bot_name, user, channel, message
    ).get_channel_id() == "qzzdms4tyb8zzbo5e8b8r56mtc"


def test_get_channel_id_error(mattermost_service):
    with pytest.raises(ValueError):
        channel_wrong = ""
        MattermostPlugin(
            mattermost_service, access_token, bot_name, user, channel_wrong, message
        ).get_channel_id()


def test_get_bot_id_error(mattermost_service):
    with pytest.raises(ValueError):
        bot_name_wrong = "wrong_bot"
        MattermostPlugin(
            mattermost_service, access_token, bot_name_wrong, user, channel, message
        ).get_bot_id()


def test_header():
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
        headers=header(
            access_token
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
        mattermost_service,
        access_token,
        bot_name,
        user,
        channel,
        message
    ).send_message_to_provided_parameter()
    MattermostPlugin(
        mattermost_service, access_token, bot_name, "", channel, message
    ).send_message_to_provided_parameter()
    MattermostPlugin(
        mattermost_service, access_token, bot_name, user, "", message
    ).send_message_to_provided_parameter()


def test_get_dataset(mattermost_service):
    result = get_dataset(url, "users/search", access_token, ["cmempy"])
    assert result[0]["username"] == f"{user}"


def test_autocomplete_error():
    with pytest.raises(ValueError):
        MattermostSearch("users", "username").autocomplete(
            ["cmem"],
            [],
            TestPluginContext()
        )


def test_autocomplete():
    MattermostSearch("users", "username").autocomplete(
        query_terms=["cmem"],
        depend_on_parameter_values=[url, access_token],
        context=TestPluginContext()
    )

    MattermostSearch("users", "username").autocomplete(
        query_terms=[],
        depend_on_parameter_values=[url, access_token],
        context=TestPluginContext()
    )
