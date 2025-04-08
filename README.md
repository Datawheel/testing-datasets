# Fruity Clickhouse

Docker container that's intended for testing and development of tesseract and clickhouse related technologies.

## How to run
1. Clone the repository

```bash
$ git clone git@github.com:Datawheel/fruity-clickhouse.git
```

2. Build the docker image
```bash
$ docker build fruity-clickhouse -t fruity
```

3. Create a docker container
```
$ docker run -d --name fruity-local -p 8123:8123 -p 9000:9000 --ulimit nofile=262144:262144 fruity
```

## For use in an ARM mac
Add a platform flag on the Dockerfile
```diff
-FROM docker.io/library/clickhouse:25.1
+FROM --platform=linux/amd64 docker.io/library/clickhouse:25.1
```
