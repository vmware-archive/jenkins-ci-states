include:
  - projects.virtualenv
  - pkgs.python.nose
  - pkgs.python.coverage

noop:
  test.succeed_without_changes:
    - require:
      - virtualenv: create-virtualenv
