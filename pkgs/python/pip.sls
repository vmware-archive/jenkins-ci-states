{%- from "_python_binary_name.sls" import python with context -%}
{%- from "pkgs/system/python-pip.sls" import pip with context -%}

include:
  - pkgs.system.python-pip


{#- Ubuntu Lucid and CentOS 5 has way too old pip package, we'll need to upgrade "by hand", salt can't do it for us #}
{% if (grains['os'] == 'Ubuntu' and grains['osrelease'].startswith('10.')) or (grains['os'] == 'CentOS' and grains['osrelease'].startswith('5.')) %}
uninstall-python-pip:
  pkg.purged:
    - name: {{ pip }}

pip-cmd:
  cmd.run:
    - name: wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py -O - | {{ python }}
    - require:
      - pkg: uninstall-python-pip
    - reload_modules: true
{% endif %}

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
      {%- if grains['os'] == 'Ubuntu' and grains['osrelease'].startswith('10.') %}
      - cmd: pip-cmd
      {%- else %}
      - pkg: python-pip
      {%- endif %}
