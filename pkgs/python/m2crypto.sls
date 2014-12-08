include:
  - pkgs.system.gcc
  - pkgs.system.pip
  - pkgs.system.swig
  - pkgs.system.openssl-dev

m2crypto:
  pip.installed:
    {%- if grains['os_family'] in ('RedHat', 'Suse') %}
    - name: git+https://github.com/martinpaljak/M2Crypto.git#egg=M2Crypto
    {%- else %}
    - name: M2Crypto
    {%- endif %}
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pkg: gcc
      - pkg: swig
      - pkg: openssl-dev
