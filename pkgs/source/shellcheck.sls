{%- set repo_clone_dir = pillar.get('shellcheck_clone_dir', '/usr/src/shellcheck-checkout') %}
{%- set shell_check_version = '0.3.5' %}

require:
  - pkgs.system.cabal-install

create-repo-clone-dir:
  file.directory:
    - name: {{ repo_clone_dir }}
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep "version:" | awk "{ print $2 }" 2> /dev/null )" = "{{ shell_check_version }}" ]'

clone:
  git.latest:
    - name: https://github.com/koalaman/shellcheck.git
    - rev: v{{ shell_check_version }}
    - target: {{ repo_clone_dir }}
    - require:
      - file: create-repo-clone-dir
      - pkg: cabal-install
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep "version:" | awk "{ print $2 }" 2> /dev/null )" = "{{ shell_check_version }}" ]'


install-shellcheck:
  cmd.run:
    - name: cabal install
    - cwd: {{ repo_clone_dir }}
    - require:
      - cmd: updated-cabal-install
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep "version:" | awk "{ print $2 }" 2> /dev/null )" = "{{ shell_check_version }}" ]'
