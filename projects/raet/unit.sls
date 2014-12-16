include:
  - projects.virtualenv
  - pkgs.python.six
  - pkgs.python.nose
  - pkgs.python.ioflo
  - pkgs.python.libnacl
  - pkgs.python.coverage
  - pkgs.python.salttesting
  - pkgs.python.msgpack-python

noop:
  test.succeed_without_changes:
    - require:
      - virtualenv: create-virtualenv
