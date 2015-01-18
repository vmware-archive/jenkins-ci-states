{%- from "pkgs/source/shellcheck.sls" import shell_check_version with context %}

cabal-install:
  pkg.installed:
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep "version:" | awk "{ print $2 }" 2> /dev/null )" = "{{ shell_check_version }}" ]'

update-cabal:
  cmd.run:
    - name: cabal update
    - require:
      - pkg: cabal-install
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep version:" | awk "{ print $2 }" 2> /dev/null )" = "{{ shell_check_version }}" ]'

updated-cabal-install:
  cmd.run:
    - name: cabal install cabal-install
    - require:
      - cmd: update-cabal
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep "version:" | awk "{ print $2 }" 2> /dev/null )" = "{{ shell_check_version }}" ]'
