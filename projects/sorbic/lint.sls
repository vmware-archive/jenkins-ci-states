include:
  - pkgs.system.pip
  - pkgs.python.msgpack
  - projects.sorbic.virtualenv

install_pylint:
  pip.installed:
    - name: 'PyLint==1.4.0'
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: python-pip
      - virtualenv: {{ salt['config.get']('virtualenv_path') }}
      - pip: msgpack-python
