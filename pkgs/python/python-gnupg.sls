include:
  - pkgs.python.pip

{%- if grains['os'] == 'Fedora' %}
uninstall-python-gnupg:
  pkg.removed:
    - name: python-gnupg
{%- endif %}

python-gnupg:
  pip.installed:
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pip: pip
      {%- if grains['os'] == 'Fedora' %}
      - pkg: uninstall-python-gnupg
      {%- endif %}
