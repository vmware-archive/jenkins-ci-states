include:
  - pkgs.system.git
  - pkgs.system.pip

gitpythton:
  pip.installed:
    - name: 'GitPython>=0.3.2rc1'
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - upgrade: True
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pkg: git
