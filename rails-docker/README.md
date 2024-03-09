# README

## Installation

Install Docker and docker-compose from the [official site](https://docs.docker.com/compose/install/).

## Version

- Ruby version 3.2.2
- Rails 7.1.3
- Database mysql

## Setup

```bash
$ docker-compose build
$ docker-compose run --rm app bundle install
$ docker-compose up -d
$ docker-compose exec app bundle exec rails db:create
$ docker-compose exec app bundle exec rails db:migrate
$ docker-compose exec app bundle exec rails db:seed
$ docker-compose ps
```

## Rspec

```bash
$ docker-compose exec app bundle exec rspec
```

## Rescue

```bash
$ docker-compose run web foreman start -f Procfile.dev
```

## Curl

```bash
curl -v http://localhost:3000/api/v1/notes
curl -v http://localhost:3000/api/v1/notes/5
curl -v http://localhost:3000/api/v1/notes?query=sed
curl -H 'Content-Type: application/json' -d '{ "title":"foo","content":"bar"}' -X POST http://localhost:3000/api/v1/notes
```
