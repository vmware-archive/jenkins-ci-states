include:
  - pkgs.system.gcc
  - pkgs.system.pip

pyyaml:
  pip.installed:
    - name: PyYAML
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pkg: gcc
