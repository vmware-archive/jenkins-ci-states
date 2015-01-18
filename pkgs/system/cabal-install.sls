{%- from "pkgs/source/shellcheck.sls" import shell_check_version with context %}

include:
  - pkgs.system.zlib-dev

cabal-install:
  pkg.installed

update-cabal:
  cmd.run:
    - name: cabal update
    - require:
      - pkg: cabal-install

updated-cabal-install:
  cmd.run:
    - name: cabal install cabal-install
    - require:
      - pkg: zlib-dev
      - cmd: update-cabal
