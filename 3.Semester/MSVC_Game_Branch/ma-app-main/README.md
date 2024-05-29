# Mikro Adventures

## Intro

This repo hosts the game _Mikro Adventures_ that was built to be an experimental environment to experience certain microservice patterns.
The game is inspired by [gameon!](https://www.gameontext.org/)

## Technologies

- Flask (https://flask.palletsprojects.com/en/3.0.x/)
- ApiFlask (https://apiflask.com/)
- SQLAlchemy (https://www.sqlalchemy.org/)
- mySQL (https://www.mysql.com/de/)
- Docker Compose (https://docs.docker.com/compose/)
- pyTest (https://docs.pytest.org/en/8.0.x/)
- Gunicorn (https://gunicorn.org/)
- Vue (https://vuejs.org/)


## Installation

clone this repository and its sub-repositories with

```bash
git clone --recurse-submodules [repository path]
```


Development Env (with Hot reload):

```bash
docker compose up --build
```

Run tests:

```bash
docker compose -f compose.test.yaml up --build
```

production:

```bash
docker compose -f compose.prod.yaml up --build
```

## Design

```plantuml

proxy -- frontend
proxy -- backend
backend -- db

hide empty members
hide circle

```

## Use Cases

```plantuml

actor user

(register user)
(login user)
(register room)
(move to room)
(interact with room)

actor map

(connect rooms)
(move user)

```


## CI/CD

CI Variable (GitLab CI)

- DEPLOY_TARGET - IP-address or DNS-name of the target server
- SSH_HOST_KEY - ssh-keyscan of the target server
- SSH_PRIVATE_KEY - private key to connect to the target server via SSH


## License

© 2024. This work is openly licensed via [CC BY-NC.SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).