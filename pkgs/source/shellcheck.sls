{%- set repo_clone_dir = pillar.get('shellcheck_clone_dir', '/tmp/shellcheck-checkout') %}
{%- set shell_check_version = '0.3.5' %}

include:
  - pkgs.system.cabal-install

create-repo-clone-dir:
  file.directory:
    - name: {{ repo_clone_dir }}

clone:
  git.latest:
    - name: https://github.com/koalaman/shellcheck.git
    - rev: v{{ shell_check_version }}
    - target: {{ repo_clone_dir }}
    - require:
      - file: create-repo-clone-dir
      - pkg: cabal-install


install-shellcheck:
  cmd.run:
    - name: cabal install
    - cwd: {{ repo_clone_dir }}
    - require:
      - cmd: updated-cabal-install
