# docker-pgroonga

A Docker image for PGroonga, including:

- PGroonga 2.2.7
- Groonga 10.0.9
- MeCab 0.996 + IPADIC 2.7.0-20070801
- PostgreSQL 12 / Alpine Linux

## Build

```sh
docker build -t takehiko/pgroonga .
```

## Run

```sh
docker run --rm -d -p 45432:5432 --name pgr takehiko/pgroonga
```

## If you need a Docker image including PostgreSQL 9.6

```sh
git checkout -b pg-9 origin/pg-9
docker build -t takehiko/pgroonga:pg-9 .
docker run --rm -d -p 45432:5432 --name pgr takehiko/pgroonga:pg-9
```

## See also

- http://groonga.org/
- https://pgroonga.github.io/
- https://hub.docker.com/_/postgres/
- https://hub.docker.com/r/takehiko/pgroonga/
- [DockerでPGroonga - わさっき](https://takehikom.hateblo.jp/entry/20180130/1517314577)
