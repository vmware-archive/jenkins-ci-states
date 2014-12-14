{% set system_site_packages = pillar.get('system_site_packages', False) %}

include:
  - pkgs.system.virtualenv

/srv/virtualenvs:
  file.directory

create-virtualenv:
  virtualenv.managed:
    - name: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name', None) }}
    - system_site_packages: {{ system_site_packages }}
    - require:
      - pkg: virtualenv
      - file: /srv/virtualenvs
