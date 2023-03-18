# opentelemetry
Collecting traces and metrices from the java app using telemetry agent auto-instrumentation

This is the solution for collecting the prometheus instrumented metrics from an application running on ECS Fargat.

The approach is like, we are using ecsobserver extension in aws-otel collector container image configuration.

The collector has three sections:

1. Receiver - prometheus receiver
2. Processors - batch
3. Exporter - prometheusremotewrite
4. Extension - ecsobserver


References:
- ecsobserver: https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/observer/ecsobserver
- https://pkg.go.dev/github.com/open-telemetry/opentelemetry-collector-contrib/extension/observer/ecsobserver#readme-discovery-mechanism
- https://aws-observability.github.io/aws-otel-collector/
- Sample app: https://github.com/open-o11y/prometheus-sample-app
- https://aws-otel.github.io/docs/setup/ec2
- setup: https://github.com/build-on-aws/instrumenting-java-apps-using-opentelemetry/tree/build-on-aws-tutorial
- https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights-Prometheus-Setup-configure-ECS.html
- https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/prometheusreceiver#prometheus-receiver
- https://opentelemetry.io/docs/collector/configuration/#receivers
