"""Conftest for mattermost-service"""

from pathlib import Path

import pytest
import requests
from requests.adapters import HTTPAdapter
from urllib3.util.retry import Retry


@pytest.fixture(scope="session")
def docker_compose_file() -> Path:
    """Point pytest-docker-compose to the correct docker-compose.yml file."""
    return Path(__file__).parent.parent / "docker" / "docker-compose.yml"


@pytest.fixture(scope="module")
def mattermost_service(docker_services) -> str:  # noqa: ANN001
    """Wait for the Mattermost API to become responsive."""
    port = docker_services.port_for("mattermost", 8065)
    base_url = f"http://localhost:{port}"

    retry = Retry(total=5, backoff_factor=3, status_forcelist=[500, 502, 503, 504])
    session = requests.Session()
    session.mount("http://", HTTPAdapter(max_retries=retry))

    docker_services.wait_until_responsive(
        timeout=60.0,
        pause=2.0,
        check=lambda: session.get(f"{base_url}/health_check").ok,
    )
    return base_url
