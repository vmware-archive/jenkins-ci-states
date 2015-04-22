{%- if grains['os_family'] in ('RedHat', 'Suse') %}
  {% set zlib_dev = 'zlib-devel' %}
{%- else %}
  {% set zlib_dev = 'zlib-dev' %}
{% endif %}

zlib-dev:
  pkg.installed:
    - name: {{ zlib_dev }}
