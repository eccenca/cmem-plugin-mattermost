# cmem-plugin-mattermost

Send messages to Mattermost channels and users.

[![eccenca Corporate Memory](https://img.shields.io/badge/eccenca-Corporate%20Memory-orange)](https://documentation.eccenca.com) [![workflow](https://github.com/eccenca/cmem-plugin-mattermost/actions/workflows/check.yml/badge.svg)](https://github.com/eccenca/cmem-plugin-mattermost/actions)  

## Development

- Run [task](https://taskfile.dev/) to see all major development tasks.
- Use [pre-commit](https://pre-commit.com/) to avoid errors before commit.
- This repository was created with [this copier template](https://github.com/eccenca/cmem-plugin-template).

This plugin allows sending messages, to channels or/and users via a defined bot, in Mattermost.

The plugin can be used as a workflow plugin. For execution it needs the url of the own mattermost server, an access token and the display name or name of the bot that should send the messages.

### Parameters Needed (once in the configuration):

url: The URL of the Mattermost server to which the plugin should connect.

access_token: The access token of the bot that will be used to send the messages.

bot_name: The display name or name of the bot used to send the messages.

### Needed in configuration for static message or for dynamic in input via entities:

###### user:
The full name, username, nickname, or email address of the user(s) who will receive the message. If the message is to be sent to multiple users, separate them with a comma ",".

###### channel:
The name or display name of the channel(s) to which the message is to be sent. If the message is to be sent to multiple channels, separate them with a comma ",".

###### message:
The message to be sent.

#### Workflow mode
The plugin can send a static message to the pre-configured parameters. This message will be sent to the defined user and/or channel every time the workflow is executed.

For dynamic messages, the input of the parameters user, channel, message is done by an input via entities.

#### To test the Mattermost plugin:

    1. install cmem-plugin-mattermost
    2. task custom:mattermost:start
    3. task custom:mattermost:db:load

If you want use single test run pytest have to be configured.
Set the working directory under following path, to the one who the repository is on your local machine.
##### 
    Edit Configuration -> Edit Configuration Templates -> Python Test -> Autodetect -> Working Directory


If you want run a local test environment with cmem-orchestration you have to connect the Docker container in one network.

    1. docker network connect dockerlocalhost_default docker_mattermost_1
    2. docker network inspect dockerlocalhost_default
    3. for url parameter copy docker_mattermost_1 ip and add :8065 to ip.

### Mattermost test environment:

#### Bot-account

    Name:           "plugin-test" 
    Access-token:   "ah85ckhk6ib6zqqjh7i7j16hra"

#### Admin account:

    Name:       "cmempy-developer" 
    Password:   "cmempy-developer" 
    Email:      "cmempy-developer@eccenca.com" 
    User ID :   "hruniqwds7gg5bcm5fmn931iih"

#### User accounts:

    Name:       "user0example" 
    Password:   "Password0" 
    Email:      "user0@example.com" 
    User ID :   "r3qsjphq97fatecdtye9kmeijw"

    Name:       "user1example"
    Password:   "Password1"
    Email:      "user0@example.com"
    User ID :   "36itfo66b7dyxc9x9nec4pssoc"

    Name:       "user2example"
    Password:   "Password2"
    Email:      "user2@example.com"
    Firstname:  "User"
    Lastname:   "Eample2" 
    Nickname:   "userex2" 
    User-ID :   "z85twbta8b8bpe3qaf7n3iecwa"

###### 
    Name:       "user3example"
    Password:   "Password3"
    Email:      "user3@example.com"
    Firstname:  "User"
    Lastname:   "Eample3"
    Nickname:   "userex3"
    User-ID :   "3j4wossgfirburd63ftd5mq16c"

#### To make and save custom settings, as well as start and close the Docker container, the following task commands are available:
######
    custom:mattermost:db:dump: --> Dump the mattermost database to volume/db.sql

    custom:mattermost:db:load: --> Load the mattermost database from volume/db.sql

    custom:mattermost:start: --> Start or restart the mattermost orchestration

    custom:mattermost:stop: --> Stop the mattermost orchestration
