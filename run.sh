#!/bin/bash -x
set -o errexit

java_options="-Dfile.encoding=UTF-8"

if [ -n "${JAVA_VM_PARAMETERS}" ]; then
  java_options=${JAVA_VM_PARAMETERS}
fi

hsqldb_user="sa"

if [ -n "${HSQLDB_USER}" ]; then
  hsqldb_user=${HSQLDB_USER}
fi

hsqldb_password="sa"

if [ -n "${HSQLDB_PASSWORD}" ]; then
  hsqldb_password=${HSQLDB_PASSWORD}
fi

hsqldb_trace="-trace false"

if [ "${HSQLDB_TRACE}" = 'true' ]; then
  hsqldb_trace="-trace true"
fi

hsqldb_silent="-silent true"

if [ "${HSQLDB_SILENT}" = 'false' ]; then
  hsqldb_silent="-silent false"
fi

hsqldb_remote="-remote_open false"

if [ "${HSQLDB_REMOTE}" = 'true' ]; then
  hsqldb_remote="-remote_open true"
fi

hsqldb_database_name="hsqldb"

if [ -n "${HSQLDB_DATABASE_NAME}" ]; then
  hsqldb_database_name=${HSQLDB_DATABASE_NAME}
fi

hsqldb_database_alias="hsqldb"

if [ -n "${HSQLDB_DATABASE_ALIAS}" ]; then
  hsqldb_database_alias=${HSQLDB_DATABASE_ALIAS}
fi

exec java ${java_options} -cp /opt/hsqldb/hsqldb-2.6.1.jar org.hsqldb.Server -database.0 "file:/opt/hsqldb/data/${hsqldb_database_name};user=${hsqldb_user};password=${hsqldb_password}" -dbname.0 ${hsqldb_database_alias} ${hsqldb_trace} ${hsqldb_silent} ${hsqldb_remote}
