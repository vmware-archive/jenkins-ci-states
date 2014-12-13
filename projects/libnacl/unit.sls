include:
  - projects.virtualenv
  - pkgs.python.nose
  - pkgs.python.coverage
  - pkgs.python.salttesting

noop:
  test.succeed_without_changes:
    - require:
      - virtualenv: create-virtualenv
