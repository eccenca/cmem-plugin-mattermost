# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

`cmem-plugin-mattermost` is a Python plugin for [eccenca Corporate Memory (CMEM)](https://documentation.eccenca.com) that sends messages to Mattermost channels and users via a bot account. It is built on the `cmem-plugin-base` framework and packaged with Poetry.

## Architecture

The plugin has two source files:

- `cmem_plugin_mattermost/__init__.py` — package marker (empty except docstring)
- `cmem_plugin_mattermost/workflow/mattermost_plugin.py` — the entire plugin implementation

### Core classes and functions

- **`MattermostPlugin`** (class) — The main plugin, decorated with `@Plugin(...)`. Extends `WorkflowPlugin`. Handles both static (pre-configured user/channel/message) and dynamic (entity-driven) messaging modes.
  - `execute()` — entry point; processes static params and/or entity inputs
  - `send_message()` → `send_message_to_user()` / `send_message_to_channel()` — dispatches based on recipients
  - `get_id()` — resolves a user/bot name to Mattermost user ID via API search
  - `get_channel_id()` — resolves a channel name to ID via API search

- **`MattermostSearch`** (class) — Custom `StringParameterType` with autocompletion that queries the Mattermost API for users/channels.

- Module-level helpers: `header()`, `get_request_handler()`, `get_dataset()` — thin wrappers around `requests` for the Mattermost REST API (`/api/v4/...`).

## Development Commands

All commands use `task` (Taskfile) or `poetry run`:

```shell
# Install dependencies
poetry install

# Run all checks (linters + tests)
task check

# Run just the linters (ruff, mypy, deptry, trivy)
task check:linters

# Run tests only (pytest with coverage)
task check:pytest

# Format code
task format:fix        # obvious fixes
task format:fix-unsafe # also unsafe fixes

# Build package
task build

# Pre-commit hooks (run before committing)
pre-commit run --all-files
```

### Running tests

```shell
# Run all tests
poetry run pytest

# Run a single test file
poetry run pytest tests/test_mattermost.py

# Run a single test
poetry run pytest tests/test_mattermost.py::test_header
```

Tests marked with `@needs_cmem` need a reachable Corporate Memory deployment, because they
construct a `TestExecutionContext`/`TestPluginContext`, which fetches a real OAuth token on
construction; they skip when `CMEM_BASE_URI` is unset. That is independent of Mattermost: the
`mattermost_service` fixture starts the local Mattermost container via `pytest-docker` and
returns its base URL, so any test taking that fixture needs Docker, marker or not.

### Local Mattermost test environment

`TaskfileCustom.yaml` is included with `flatten: true`, so these tasks carry no namespace prefix:

```shell
task mattermost:start    # docker compose up
task mattermost:db:load  # restore known database state
task mattermost:stop     # cleanup containers
```

See README.md for pre-configured test user accounts and bot credentials.

## Key conventions

- **Python 3.13** target (`.python-version`, `pyproject.toml` ruff config)
- **ruff** with `line-length = 100`, target py313, `select = ["ALL"]` with a curated `ignore` list
  and `per-file-ignores` for `tests/` in `pyproject.toml`. Do not extend either list and do not add
  `# noqa` to silence a finding — see `.claude/rules/copier-template.md`.
- **mypy** with `warn_return_any = true`, `ignore_missing_imports = true`
- **Poetry** for dependency management; the project uses `poetry-dynamic-versioning` for version bumps from git tags
- **License**: Apache-2.0
- This repo was bootstrapped from the [cmem-plugin-template](https://github.com/eccenca/cmem-plugin-template)
  (Copier); the rendered version is recorded as `_commit` in `.copier-answers.yml`