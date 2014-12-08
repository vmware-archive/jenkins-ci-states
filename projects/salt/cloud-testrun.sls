include:
  - pkgs.system.pip
  {%- if salt['config.get']('virtualenv_path', None)  %}
  - projects.salt.virtualenv
  {%- endif %}
  - pkgs.python.salttesting
  - pkgs.python.requests

noop:
  test.succeed_without_changes
