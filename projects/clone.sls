include:
  - pkgs.system.cpio
  - pkgs.system.xz

noop:
  test.succeed_without_changes:
    - require:
      - pkg: cpio
      - pkg: xz
