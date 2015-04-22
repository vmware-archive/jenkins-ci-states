{% set cpio = 'cpio' %}

cpio:
  pkg.latest:
    - name: {{ cpio }}
