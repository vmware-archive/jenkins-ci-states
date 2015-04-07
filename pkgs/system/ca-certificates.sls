{%- if grains['os'] == 'openSUSE' %}
  {%- set ca_certificates = 'ca-certificates-mozilla' %}
{%- else %}
  {%- set ca_certificates = 'ca-certificates' %}
{%- endif %}

include:
  - pkgs.system.openssl
  {%- if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
  - pkgs.system.wget
  {%- endif %}

{% if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
download-ca-certificates:
  cmd.run:
    - name: wget -O /etc/pki/tls/certs/ca-bundle.crt http://curl.haxx.se/ca/cacert.pem
    - require:
      - pkg: wget
      - pkg: openssl
{%- else %}
install-ca-certificates:
  pkg.latest:
    - name: {{ ca_certificates }}
    - require:
      - pkg: openssl
{%- endif %}

ca-certificates:
  test.succeed_with_changes:
    - watch:
      {%- if grains['os_family'] == 'RedHat' and grains['osmajorrelease'][0] == '5' %}
      - cmd: download-ca-certificates
      {%- else %}
      - pkg: install-ca-certificates
      {%- endif %}
