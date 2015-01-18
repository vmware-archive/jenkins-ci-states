include:
  - pkgs.source.shellcheck

noop:
  test.succeed_without_changes:
    - require:
      - cmd: install-shellcheck
