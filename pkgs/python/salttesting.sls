include:
  - pkgs.system.pip
  - pkgs.python.pep8
  - pkgs.python.mock
  - pkgs.python.coverage
  - pkgs.python.modernize
  - pkgs.python.unittest-xml-reporting
  {%- if grains.get('pythonversion')[:2] < [2, 7] %}
  - pkgs.python.unittest2
  {%- endif %}

salttesting:
  pip.installed:
    - name: git+https://github.com/saltstack/salt-testing.git@6e0941f0295398d5117b432ed80c86d4c83aa531#egg=SaltTesting
    {%- if salt['config.get']('virtualenv_path', None)  %}
    - bin_env: {{ salt['config.get']('virtualenv_path') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pkg: pip
      - pip: pep8
      - pip: mock
      - pip: coverage
      - pip: modernize
      - pip: unittest-xml-reporting
      {%- if grains.get('pythonversion')[:2] < [2, 7] %}
      - pip: unittest2
      {%- endif %}
