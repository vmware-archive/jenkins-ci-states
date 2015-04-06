{%- if grains['os'] == 'openSUSE' %}
  {%- set ca_certificates = 'ca-certificates-mozilla' %}
{%- else %}
  {%- set ca_certificates = 'ca-certificates' %}
{%- endif %}

ca-certificates:
  pkg.latest:
    - name: {{ ca_certificates }}
