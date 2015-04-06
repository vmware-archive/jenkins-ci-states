{%- if grains['os'] == 'Gentoo' %}
  {% set sed = 'sys-apps/sed' %}
{%- else %}
  {% set sed = 'sed' %}
{%- endif %}

sed:
  pkg.latest:
    - name: {{ sed }}
