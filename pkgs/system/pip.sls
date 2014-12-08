{%- if grains['os'] == 'Arch' %}
  {% set pip = 'python2-pip' %}
{%- else %}
  {% set pip = 'python-pip' %}
{%- endif %}

pip:
  pkg.installed:
    - name: {{ pip }}
