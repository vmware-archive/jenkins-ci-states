include:
  - projects.sorbic.virtualenv
  - pkgs.python.nose
  - pkgs.python.coverage
  - pkgs.python.salttesting
  - pkgs.python.msgpack-python
  - pkgs.python.unittest-xml-reporting


noop:
  test.succeed_without_changes
