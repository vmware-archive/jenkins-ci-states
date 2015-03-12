{%- set repo_clone_dir = pillar.get('shellcheck_clone_dir', '/tmp/shellcheck-checkout') %}
{%- set shell_check_version = '0.3.5' %}

include:
  - pkgs.system.cabal-install

create-repo-clone-dir:
  file.directory:
    - name: {{ repo_clone_dir }}
    - onlyif: [ "$(shellcheck --version 2>/dev/null | grep version: | awk '{print $2}')" != "{{ shell_check_version }}" ]

clone:
  git.latest:
    - name: https://github.com/koalaman/shellcheck.git
    - rev: v{{ shell_check_version }}
    - target: {{ repo_clone_dir }}
    - onlyif: [ "$(shellcheck --version 2>/dev/null | grep version: | awk '{print $2}')" != "{{ shell_check_version }}" ]
    - require:
      - file: create-repo-clone-dir
      - pkg: cabal-install


install-shellcheck:
  cmd.run:
    - name: cabal install --prefix=/usr
    - cwd: {{ repo_clone_dir }}
    - onlyif: [ "$(shellcheck --version 2>/dev/null | grep version: | awk '{print $2}')" != "{{ shell_check_version }}" ]
    - require:
      - cmd: updated-cabal-install
