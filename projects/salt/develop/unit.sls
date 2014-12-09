{% set test_git_url =  pillar.get('test_git_url', 'https://github.com/saltstack/salt.git') %}
{% set test_transport = pillar.get('test_transport', 'zeromq') %}

include:
  {#- Include the Salt repository clone step ---------------------------------------------------- #}
  - projects.salt.repo
  {#- Include system packages ------------------------------------------------------------------- #}
  - pkgs.system.git
  - pkgs.system.patch
  {%- if grains['os'] == 'openSUSE' %}
  {#- Yes! openSuse ships xml as separate package #}
  - pkgs.system.python-xml
  {%- endif %}
  {%- if grains['os'] == 'Arch' or (grains['os'] == 'Ubuntu' and grains['osrelease'].startswith('14.')) %}
  - pkgs.system.lxc
  {%- endif %}
  {%- if grains['os'] == 'openSUSE' %}
  - pkgs.system.python-zypp
  {%- endif %}
  - pkgs.system.dnsutils
  - pkgs.system.python-mysqldb
  {#- Include python packages ------------------------------------------------------------------- #}
  {%- if grains.get('pythonversion')[:2] < [2, 7] %}
  - pkgs.python.argparse
  {%- endif %}
  - pkgs.python.virtualenv
  - pkgs.python.salttesting
  - pkgs.python.timelib
  - pkgs.python.apache-libcloud
  - pkgs.python.requests
  - pkgs.python.keyring
  - pkgs.python.python-gnupg
  - pkgs.python.cherrypy
  - pkgs.python.gitpython
  - pkgs.python.supervisor
  - pkgs.python.boto
  - pkgs.python.moto
  - pkgs.python.psutil
  - pkgs.python.tornado
  {%- if test_transport == 'raet' %}
  - pkgs.python.libnacl
  - pkgs.python.ioflo
  - pkgs.python.raet
  {%- endif %}

noop:
  test.succeed_without_changes:
    - require:
      - git: clone
