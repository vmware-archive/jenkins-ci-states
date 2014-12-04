{%- if grains['os'] == 'Arch' %}
  {% set pkg_name = 'python2-setuptools' %}
{%- else %}
  {% set pkg_name = 'python-setuptools' %}
{%- endif %}

{{ pkg_name }}:
  pkg.installed
