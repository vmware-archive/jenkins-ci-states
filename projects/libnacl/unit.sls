include:
  - projects.libnacl.virtualenv
  - pkgs.python.nose
  - pkgs.python.coverage

noop:
  test.succeed_without_changes
