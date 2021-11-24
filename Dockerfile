FROM openjdk:17

RUN mkdir -p /opt/hsqldb/data/
WORKDIR /opt/hsqldb/
ADD run.sh /opt/hsqldb/run.sh
RUN chmod +x /opt/hsqldb/run.sh
RUN curl -o hsqldb-2.6.1.jar  https://repo1.maven.org/maven2/org/hsqldb/hsqldb/2.6.1/hsqldb-2.6.1.jar
ENTRYPOINT ["/opt/hsqldb/run.sh"]
