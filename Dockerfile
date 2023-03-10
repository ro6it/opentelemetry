FROM maven:3.8.1-openjdk-17-slim

VOLUME /tmp
ADD . /usr/src/app
WORKDIR /usr/src/app

RUN mvn clean package -DskipTests
ENV OTEL_TRACES_EXPORTER=otlp
ENV OTEL_METRICS_EXPORTER=otlp
ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://3.237.254.36:5555

ENV OTEL_RESOURCE_ATTRIBUTES=service.name=hello-app,service.version=1.0
ENV OTEL_TRACES_SAMPLER=always_on
ENV OTEL_IMR_EXPORT_INTERVAL=1000
ENV OTEL_METRIC_EXPORT_INTERVAL=1000
RUN curl -L https://github.com/aws-observability/aws-otel-java-instrumentation/releases/download/v1.19.2/aws-opentelemetry-agent.jar --output opentelemetry-javaagent-all.jar
EXPOSE 8888
ENTRYPOINT [ "java", "-javaagent:opentelemetry-javaagent-all.jar", "-jar", "target/hello-app-1.0.jar" ]
