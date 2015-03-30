include:
  - pkgs.system.python-pip

pip:
  pip.installed:
    {%- if salt['config.get']('virtualenv_name', None) %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - upgrade: true
    - reload_modules: true
    - require:
      - pkg: python-pip
