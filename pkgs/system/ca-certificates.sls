{%- if grains['os'] == 'openSUSE' %}
  {%- set ca_certificates = 'ca-certificates-mozilla' %}
{%- else %}
  {%- set ca_certificates = 'ca-certificates' %}
{%- endif %}

{%- if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
include:
  - pkgs.system.wget

download-ca-certificates:
  cmd.run:
    - name: wget -O /etc/pki/tls/certs/ca-bundle.crt http://curl.haxx.se/ca/cacert.pem
    - require:
      - pkg: wget
{%- else %}
install-ca-certificates:
  pkg.latest:
    - name: {{ ca_certificates }}
{%- endif %}

ca-certificates:
  test.succeed_with_changes:
    - watch:
      {%- if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
      - cmd: download-ca-certificates
      {%- else %}
      - pkg: install-ca-certificates
      {%- endif %}
