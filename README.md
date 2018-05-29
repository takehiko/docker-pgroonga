# docker-pgroonga

A Docker image for PGroonga, including:

- PGroonga 2.0.6
- Groonga 8.0.3
- MeCab 0.996 + IPADIC 2.7.0-20070801
- PostgreSQL 9.6 / Alpine Linux

## Build

```sh
docker build -t takehiko/pgroonga .
```

## Run

```sh
docker run --rm -d -p 45432:5432 --name pgr takehiko/pgroonga
```

## See also

- https://hub.docker.com/_/postgres/
- http://groonga.org/
- https://pgroonga.github.io/
- https://hub.docker.com/r/iquiw/pgroonga-on-postgres/
- [Alpine LinuxでMeCab with NEologd](https://qiita.com/nownabe/items/4171776aec1f05de9f28)
- [DockerでPGroonga - わさっき](http://d.hatena.ne.jp/takehikom/20180130/1517314577)
