"""pytest configuration."""
import pytest
import requests
from pytest_docker_compose import ContainerGetter
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry


@pytest.fixture()
def mattermost_service(module_scoped_container_getter: ContainerGetter) -> str:
    """Wait for the api from mattermost to become responsive"""
    retry = Retry(total=5, backoff_factor=3, status_forcelist=[500, 502, 503, 504])
    session = requests.Session()
    session.mount("http://", HTTPAdapter(max_retries=retry))
    service = module_scoped_container_getter.get("mattermost").network_info[0]
    base_url = f"http://{service.hostname}:{service.host_port}"

    assert session.get(f"{base_url}/health_check").ok
    return base_url
