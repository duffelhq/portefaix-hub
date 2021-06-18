---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ printf "%s-%s" (include "grafana-mixin.fullname" .) "__name__" | trunc 63 | trimSuffix "-" }}
  namespace: {{ include "grafana-mixin.namespace" . }}
  annotations:
{{ include "grafana-mixin.annotations" . | indent 4 }}
{{- if .Values.additionalAnnotations }}
{{ toYaml .Values.additionalAnnotations | indent 4 }}
{{- end }}
  labels:
    app: {{ include "grafana-mixin.name" . }}
{{ include "grafana-mixin.labels" . | indent 4 }}
{{- if .Values.additionalLabels }}
{{ toYaml .Values.additionalLabels | indent 4 }}
{{- end }}
    grafana_dashboard: {{ include "grafana-mixin.name" . }}-__name__
data:
