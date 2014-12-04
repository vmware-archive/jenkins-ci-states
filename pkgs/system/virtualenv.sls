{%- if grains['os'] == 'Arch' %}
  {% set pkg_name = 'python2-virtualenv' %}
{%- else %}
  {% set pkg_name = 'python-virtualenv' %}
{%- endif %}

{{ pkg_name }}:
  pkg.installed
