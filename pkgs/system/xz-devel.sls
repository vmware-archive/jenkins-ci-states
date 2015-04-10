{% set xz_devel = 'xz-devel' %}

xz-devel:
  pkg.latest:
    - name: {{ xz_devel }}
