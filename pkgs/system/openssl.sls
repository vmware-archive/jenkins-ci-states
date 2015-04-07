{% set openssl = 'openssl' %}

openssl:
  pkg.latest:
    - name: {{ openssl }}
