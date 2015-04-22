{%- if grains['os'] == 'Gentoo' %}
  {% set sed = 'sys-apps/sed' %}
{%- else %}
  {% set sed = 'sed' %}
{%- endif %}

sed:
  pkg.installed:
    - name: {{ sed }}
