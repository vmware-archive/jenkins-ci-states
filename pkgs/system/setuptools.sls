{%- if grains['os'] == 'Arch' %}
  {% set setuptools = 'python2-setuptools' %}
{%- else %}
  {% set setuptools = 'python-setuptools' %}
{%- endif %}

{{ setuptools }}:
  pkg.installed
