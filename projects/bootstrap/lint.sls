{%- from "pkgs/source/shellcheck.sls" import shell_check_version with context %}

include:
  - pkgs.source.shellcheck

noop:
  test.succeed_without_changes:
    - require:
      - cmd: install-shellcheck
    - onlyif: '[ "$( shellcheck -V 2> /dev/null | grep "version:" | awk "{ print $2 }" 2> /dev/null )" != "{{ shell_check_version }}" ]'
