include:
  - pkgs.system.cpio
  - pkgs.system.xz
  {%- if salt['config.get']('virtualenv_name', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.salttesting

noop:
  test.succeed_without_changes:
    - require:
      - pkg: cpio
      - pkg: xz
      {%- if salt['config.get']('virtualenv_name', None)  %}
      - virtualenv: create-virtualenv
      {%- endif %}
      - pip: salttesting
