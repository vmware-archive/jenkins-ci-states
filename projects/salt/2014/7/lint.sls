include:
  - pkgs.system.pip
  {%- if salt['config.get']('virtualenv_name', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.saltpylint
  - pkgs.python.salttesting
  - pkgs.python.requests
  - pkgs.python.jinja2
  - pkgs.python.pyyaml
  - pkgs.python.msgpack-python
  - pkgs.python.m2crypto
  - pkgs.python.libnacl
  - pkgs.python.ioflo
  - pkgs.python.raet
  - pkgs.python.apache-libcloud

install_pylint:
  pip.installed:
    - name: 'PyLint==1.3.1'
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      {%- if salt['config.get']('virtualenv_name', None)  %}
      - virtualenv: create-virtualenv
      {%- endif %}
