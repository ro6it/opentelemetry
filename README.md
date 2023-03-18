# opentelemetry
Collecting traces and metrices from the java app using telemetry agent auto-instrumentation

This is the solution for collecting the prometheus instrumented metrics from an application running on ECS Fargat.

The approach is like, we are using ecsobserver extension in aws-otel collector container image configuration.

The collector has three sections:

1. Receiver - prometheus receiver
2. Processors - batch
3. Exporter - prometheusremotewrite
4. Extension - ecsobserver
