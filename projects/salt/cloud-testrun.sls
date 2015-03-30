include:
  - pkgs.python.pip
  {%- if salt['config.get']('virtualenv_name', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.salttesting
  - pkgs.python.requests

noop:
  test.succeed_without_changes{%- if salt['config.get']('virtualenv_name', None)  %}:
    - require:
      - virtualenv: create-virtualenv
    {%- endif %}
