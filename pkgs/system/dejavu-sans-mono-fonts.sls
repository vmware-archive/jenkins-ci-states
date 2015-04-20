{%- set font_name = 'dejavu-sans-mono-fonts' %}

dejavu-sans-mono-fonts:
  pkg.installed:
    - name: {{ font_name }}
