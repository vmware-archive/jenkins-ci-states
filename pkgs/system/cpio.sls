{% set cpio = 'cpio' %}

cpio:
  pkg.installed:
    - name: {{ cpio }}
