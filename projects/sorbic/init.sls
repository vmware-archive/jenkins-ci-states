include:
  - pkgs.system.virtualenv
  - pkgs.python.msgpack

{{ salt['config.get']('virtualenv_path') }}:
  virtualenv.managed:
    - system_site_packages: False
    - require:
      - pkg: python-virtualenv
      - pip: msgpack-python
