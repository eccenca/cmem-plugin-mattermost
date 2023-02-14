# Invoking this fixture: 'function_scoped_container_getter' starts all services
import pytest
from requests import Session
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry


@pytest.fixture
def mattermost_service(session_scoped_container_getter) -> str:
    """Wait for the api from mattermost to become responsive"""
    service = session_scoped_container_getter.get("mattermost").network_info[0]

    base_url = f"http://{service.hostname}:{service.host_port}"

    retry = Retry(total=5, backoff_factor=30, status_forcelist=[500, 502, 503, 504])
    session = Session()
    session.mount("http://", HTTPAdapter(max_retries=retry))

    assert session.get(f"{base_url}/health_check").ok
    return base_url
