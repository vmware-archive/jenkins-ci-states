include:
  - pkgs.system.pip
  {%- if salt['config.get']('virtualenv_name', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.six
  - pkgs.python.ioflo
  - pkgs.python.enum34
  - pkgs.python.libnacl
  - pkgs.python.salttesting

install_pylint:
  pip.installed:
    - name: 'PyLint==1.4.1'
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - upgrade: true
    - require:
      - pkg: pip
      {%- if salt['config.get']('virtualenv_name', None)  %}
      - virtualenv: create-virtualenv
      {%- endif %}
      - pip: six
      - pip: ioflo
      - pip: enum34
      - pip: libnacl
      - pip: salttesting
