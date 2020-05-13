{{- define "metadata.name" -}}
  {{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | snakecase | replace "_" "-" | trunc 63 |  trimSuffix "-" -}}
  {{- else -}}
{{- $name :=  default .Chart.Name .Release.Name .Values.nameOverride -}}
    {{- if contains $name .Release.Name -}}
{{- .Release.Name | snakecase | replace "_" "-"  | trunc 63 | trimSuffix "-" -}}
    {{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "metadata.labels" }}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{ end -}}

{{- define "pod.labels" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: {{ .Values.service.name }}
{{ end -}}
