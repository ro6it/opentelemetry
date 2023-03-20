# opentelemetry

This is the solution for collecting the prometheus instrumented metrics from an application which is running on AWS ECS Fargate.

## Problem statement:
  The challenge we faced in setting up monitoring for ECS fargate was to get the list of ECS tasks dynamically so that we can monitor them.
  
## Solution:

In this solution, we are leveraging the AWS opentelemetry collector (ADOT Collector) to collect the metrics and manage the service discovery of the fargate tasks (targets).

The approach is, we are using ecsobserver extension in aws-otel collector configuration and managing the service discovery using prometheus file based service discovery file_sd_configs

The ecsobserver uses the ECS/EC2 API to discover prometheus scrape targets from all running tasks and filter them based on service names, task definitions and container labels.

The collector configuration has three sections:

1. Receiver - using prometheus receiver
2. Processors - batch
3. Exporter - prometheusremotewrite
4. Extension - ecsobserver

In our case - the sample application is running on fargate task which is exposing the metrics on port 8080/metrics and we are running prometheus, ADOT collector and grafana on a EC2 instance as containers in the same VPC. In order to allow API calls to ECS we have attached the role having permissions to ec2 instance.


References:
- ecsobserver: 
  https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/observer/ecsobserver
  https://pkg.go.dev/github.com/open-telemetry/opentelemetry-collector-contrib/extension/observer/ecsobserver#readme-discovery-mechanism
- https://aws-observability.github.io/aws-otel-collector/
- Sample app:
  https://github.com/open-o11y/prometheus-sample-app
- https://aws-otel.github.io/docs/setup/ec2
- setup: https://github.com/build-on-aws/instrumenting-java-apps-using-opentelemetry/tree/build-on-aws-tutorial
- https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/ContainerInsights-Prometheus-Setup-configure-ECS.html
- https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/prometheusreceiver#prometheus-receiver
- https://opentelemetry.io/docs/collector/configuration/#receivers
