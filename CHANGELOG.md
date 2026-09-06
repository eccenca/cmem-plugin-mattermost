# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/) and this project adheres to [Semantic Versioning](https://semver.org/)

## [2.5.0] 2026-09-06

### Fixed

- a message with neither a user nor a channel is now refused with `No recipient.`
  instead of being silently dropped while the run reported success; an empty
  message with a valid recipient now reports `No message.` rather than the
  misleading `No recipient.`
- autocompletion of users and channels now searches for all typed words instead
  of concatenating them, so `john doe` no longer searches for `johndoe`
- the task now stops when the workflow is cancelled, and reports its progress
  while running instead of only after the last entity
- the number of sent messages in the execution report now counts messages rather
  than entities, so an entity naming both a user and a channel counts twice
- the badges in `README.md` render as badges again; their link definitions were
  swallowed by the preceding table for want of a blank line

### Changed

- rewrote the task documentation and every parameter description against the
  actual behaviour: the ports and what they carry, that the task is a terminal
  step, and that a message configured on the task is sent in addition to the
  entity messages rather than as a fallback for them
- corrected the `Channel` description, which promised that a comma separated
  list is sent to several channels — it is looked up as a single channel name
  and fails; `README.md` claimed the same for users and channels
- corrected the `Bot name` description, which offered a display name that
  Mattermost does not match against
- the execution report reads `No. of messages sent` instead of
  `No. of messages send:`
- updated dependencies and template, including the `cmem-plugin-base` floor
  (`^4.19.0` to `^4.20.0`)
- `TaskfileCustom.yaml` uses Compose v2 (`docker compose`) and the Compose v2
  container name `docker-mattermost-1`

## [2.4.0] 2026-08-17

### Changed

- update template
- remove obsolete `cmem-cmempy` dependency


## [2.3.0] 2025-10-20

### Changed

- upgrade template for python 3.13 compatability
- changed from pytest_docker_compose to pytest-docker in test suite 
  - this was needed since urllib required a certain docker version that pytest_docker_compose could not fulfill


## [2.2.0] 2024-03-24

### Changed

- upgrade template to 6.1


## [2.1.0] 2023-10-29

### Added

- custom icon
- port specification
- better documentation

### Changed

- upgrade template to 5.3 (CMEM >= 23.3, cmem-plugin-base 4.3.0)


## [2.0.0] 2023-07-17

### Changed

- upgrade template to 5.0.2 (python 3.11, CMEM 23.2, cmem-plugin-base 4)
- dependency updates


## [1.0.0] 2023-03-13

### Added

- initial version
