include:
  - pkgs.system.pip
  {%- if salt['config.get']('virtualenv_name', None)  %}
  - projects.virtualenv
  {%- endif %}
  - pkgs.python.msgpack-python
  - pkgs.python.salttesting

install_pylint:
  pip.installed:
    - name: 'PyLint==1.4.1'
    - upgrade: true
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pip: msgpack-python
      - pip: salttesting
      {%- if salt['config.get']('virtualenv_name', None)  %}
      - virtualenv: create-virtualenv
      {%- endif %}
