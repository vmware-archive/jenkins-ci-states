{%- if grains['os'] == 'openSUSE' %}
  {%- set ca_certificates = 'ca-certificates-mozilla' %}
{%- else %}
  {%- set ca_certificates = 'ca-certificates' %}
{%- endif %}

{%- if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
download-ca-certificates:
  file.managed:
    - name: /etc/pki/tls/certs/ca-bundle.crt
    - source: http://curl.haxx.se/ca/cacert.pem
{%- else %}
install-ca-certificates:
  pkg.latest:
    - name: {{ ca_certificates }}
{%- endif %}

ca-certificates:
  test.succeed_with_changes:
    - watch:
      {%- if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
      - file: download-ca-certificates
      {%- else %}
      - pkg: install-ca-certificates
      {%- endif %}
