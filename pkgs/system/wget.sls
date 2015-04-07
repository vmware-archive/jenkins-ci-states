{% set wget = 'wget' %}

wget:
  pkg.latest:
    - name: {{ wget }}
