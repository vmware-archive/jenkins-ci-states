{% from 'pkgs/system/virtualenv.sls' import virtualenv with context %}

include:
  - pkgs.system.virtualenv

{{ salt['config.get']('virtualenv_path') }}:
  virtualenv.managed:
    - system_site_packages: False
    - require:
      - pkg: {{ virtualenv }}
