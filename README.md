# HyperSQL dockerized
Image for running HyperSQL using Docker or Kubernetes. Inspired by some HSQLDB images existing out there but upgraded to the newest version and with fixed some environment variables mix-ups. Based on HyperSQL 2.6.1 and OpenJDK 17.

## Quick start
Image is hosted on [Github Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry). You can check out available tags [here](https://github.com/orgs/hycomsa/packages?repo_name=hycom-hsqldb-docker).
### Running using docker run
Usage is pretty straightforward:

`docker run -p 9001:9001 ghcr.io/hycomsa/hsqldb-image:<tag>`

You can control the database using environment variables. For example you can change the user by specifying HSQLDB_USER environment variable (see supported variables below): 

`docker run -e "HSQLDB_USER=myuser" -p 9001:9001 ghcr.io/hycomsa/hsqldb-image:<tag>`

### Running on Kubernetes
1. Use the image `ghcr.io/hycomsa/hsqldb-image` in Pod specification.
2. Mount a persistent volume in `/opt/hsqldb/data/` to preserve the data between Pod restarts.
3. Use environment variables in Pod specification to control the database settings e.g.
```
    env:
        - name: HSQLDB_USER
          value: "myuser"`
```

## Configuration options
Configuration is controlled by using environment variables. Use them if you want to override the default values. Default values for trace, silent and remote switches match values listed in [HSQLDB documentation](http://hsqldb.org/doc/2.0/guide/listeners-chapt.html#lsc_server_props).

| Variable    | Description | Default value |
| --- | --- | ---  |
| JAVA_VM_PARAMETERS    | Parameters passed to the JVM | -Dfile.encoding=UTF-8 |
| HSQLDB_USER           | Username        | sa |
| HSQLDB_PASSWORD       | Password        | sa |
| HSQLDB_TRACE          | Corresponds to server.trace in HSQLDB | false |
| HSQLDB_SILENT         | Corresponds to server.silent in HSQLDB | true |
| HSQLDB_REMOTE         | Corresponds to server.remote_open in HSQLDB | false |
| HSQLDB_DATABASE_NAME  | Database name  | hsqldb |
| HSQLDB_DATABASE_ALIAS | Database alias | hsqldb |
