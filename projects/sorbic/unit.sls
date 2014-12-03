include:
  - pkgs.python.virtualenv
  - pkgs.python.salttesting

{{ salt['config.get']('virtualenv_path') }}:
  virtualenv.managed:
    - system_site_packages: False
    - require:
      - pip: virtualenv
      - pip: salttesting

install_pylint:
  pip.installed:
    - name: 'PyLint==1.4.1'
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - virtualenv: {{ salt['config.get']('virtualenv_path') }}
