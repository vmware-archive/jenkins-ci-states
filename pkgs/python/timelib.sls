include:
  - pkgs.python.pip
  {%- if grains['os_family'] not in ('FreeBSD', 'Gentoo') %}
  - pkgs.system.gcc
  {%- endif %}
  {%- if grains['os_family'] not in ('Arch', 'Solaris', 'FreeBSD', 'Gentoo') %}
  {#- These distributions don't ship the develop headers separately #}
  - pkgs.system.python-dev
  {% endif %}


timelib:
  pip.installed:
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pip: pip
      {%- if grains['os_family'] not in ('Arch', 'Solaris', 'FreeBSD', 'Gentoo') %}
      {#- These distributions don't ship the develop headers separately #}
      - pkg: python-dev
      {%- endif %}
      {%- if grains['os_family'] not in ('FreeBSD', 'Gentoo') %}
      {#- FreeBSD always ships with gcc #}
      - pkg: gcc
      {%- endif %}
