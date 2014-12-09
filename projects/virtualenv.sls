{% set system_site_packages = pillar.get('system_site_packages', False) %}

include:
  - pkgs.system.virtualenv

create-virtualenv:
  virtualenv.managed:
    - name: create-virtualenv
    - system_site_packages: {{ system_site_packages }}
    - require:
      - pkg: virtualenv
