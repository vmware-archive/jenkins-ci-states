include:
  - pkgs.system.pip
  - pkgs.python.pep8
  - pkgs.python.mock
  - pkgs.python.requests
  - pkgs.python.coverage
  - pkgs.python.modernize
  - pkgs.python.unittest-xml-reporting
  {%- if grains.get('pythonversion')[:2] < [2, 7] %}
  - pkgs.python.unittest2
  {%- endif %}

salttesting:
  pip.installed:
    - name: git+https://github.com/saltstack/salt-testing.git#egg=SaltTesting
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - upgrade: True
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pip: pep8
      - pip: mock
      - pip: coverage
      - pip: modernize
      - pip: requests
      - pip: unittest-xml-reporting
      {%- if grains.get('pythonversion')[:2] < [2, 7] %}
      - pip: unittest2
      {%- endif %}
