FROM openjdk:17

RUN mkdir -p /opt/hsqldb/data/
WORKDIR /opt/hsqldb/
#ADD hsqldb.jar /opt/hsqldb/hsqldb.jar
RUN curl -o hsqldb-2.6.1.jar  https://repo1.maven.org/maven2/org/hsqldb/hsqldb/2.6.1/hsqldb-2.6.1.jar
ADD hsqldb-default.properties /opt/hsqldb/config/hsqldb.properties
ENTRYPOINT ["java"]
CMD ["-Dfile.encoding=UTF-8", "-cp", "/opt/hsqldb/hsqldb-2.6.1.jar", "org.hsqldb.server.Server", "--props", "/opt/hsqldb/config/hsqldb.properties"]
