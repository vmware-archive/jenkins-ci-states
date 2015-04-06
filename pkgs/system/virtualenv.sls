{%- if grains['os'] == 'Arch' %}
  {% set virtualenv = 'python2-virtualenv' %}
{%- else %}
  {% set virtualenv = 'python-virtualenv' %}
{%- endif %}

virtualenv:
  pkg.latest:
    - name: {{ virtualenv }}
