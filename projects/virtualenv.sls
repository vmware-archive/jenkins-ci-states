include:
  - pkgs.system.virtualenv

create-virtualenv:
  virtualenv.managed:
    - name: {{ salt['config.get']('virtualenv_path') }}
    - system_site_packages: False
    - require:
      - pkg: virtualenv
