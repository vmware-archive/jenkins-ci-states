{%- from "pkgs/source/shellcheck.sls" import shell_check_version with context %}

include:
  - pkgs.system.zlib-dev

cabal-install:
  pkg.latest

update-cabal:
  cmd.run:
    - name: cabal update
    - onlyif: '[ "$(shellcheck --version 2>/dev/null | grep version: | cut -d " " -f 2)" != "{{ shell_check_version }}" ]'
    - require:
      - pkg: cabal-install

updated-cabal-install:
  cmd.run:
    - name: cabal install cabal-install
    - onlyif: '[ "$(shellcheck --version 2>/dev/null | grep version: | cut -d " " -f 2)" != "{{ shell_check_version }}" ]'
    - require:
      - pkg: zlib-dev
      - cmd: update-cabal
