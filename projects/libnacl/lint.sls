include:
  - pkgs.system.pip
  - pkgs.system.libsodium
  {%- if salt['config.get']('virtualenv_path', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.salttesting

install_pylint:
  pip.installed:
    - name: 'PyLint==1.4.0'
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pkg: libsodium
      {%- if salt['config.get']('virtualenv_path', None)  %}
      - virtualenv: create-virtualenv
      {%- endif %}
      - pip: salttesting
