{%- set runing_as_root = salt['cmd.run']('whoami') == 'root' %}

{%- if running_as_root %}
include:
  - pkgs.system.virtualenv
{%- endif %}

create-virtualenv:
  virtualenv.managed:
    - name: {{ salt['config.get']('virtualenv_path') }}
    - system_site_packages: False
    {%- if running_as_root %}
    - require:
      - pkg: virtualenv
    {%- endif %}
