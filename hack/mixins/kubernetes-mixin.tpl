---
apiVersion: monitoring.coreos.com/v1
kind: PrometheusRule
metadata:
  name: {{ printf "%s-%s" (include "kubernetes-mixin.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "kubernetes-mixin.namespace" . }}
  annotations:
{{ include "kubernetes-mixin.annotations" . | indent 4 }}
{{- if .Values.additionalAnnotations }}
{{ toYaml .Values.additionalAnnotations | indent 4 }}
{{- end }}
  labels:
    app: {{ include "kubernetes-mixin.name" . }}
{{ include "kubernetes-mixin.labels" . | indent 4 }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels | indent 4 }}
{{- end }}
spec:
