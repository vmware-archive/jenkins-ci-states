include:
  - pkgs.system.pip
  - pkgs.python.pep8
  - pkgs.python.modernize

salttesting:
  pip.installed:
    - name: git+https://github.com/saltstack/salt-pylint.git#egg=SaltPyLint
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - upgrade: True
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pip: pep8
      - pip: modernize
