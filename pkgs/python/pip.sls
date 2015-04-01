include:
  - pkgs.system.python-pip


{#- Ubuntu Lucid has way too old pip package, we'll need to upgrade "by hand", salt can't do it for us #}
{% if grains['os'] == 'Ubuntu' and grains['osrelease'].startswith('10.') %}
pip-cmd:
  cmd.run:
    - name: pip install --upgrade pip --install-option="--prefix=/usr"
    - require:
      - pkg: python-pip
    - reload_modules: true

{#- Uninstall the system package because it will be imported by salt, not the newer version #}
uninstall-system-python-pip:
  cmd.run:
    - name: apt-get -q -y remove python-pip
    - require:
      - cmd: pip-cmd
    - reload_modules: true

{#- Symlink the pip binary because /usr/bin/pip will be removed when uninstalling python-pip #}
symlink-python-pip:
  file.symlink:
    - name: /usr/bin/pip
    - target: /usr/bin/pip2
    - require:
      - cmd: uninstall-system-python-pip

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
      - file: symlink-python-pip
      {%- else %}
      - pkg: python-pip
      {%- endif %}
