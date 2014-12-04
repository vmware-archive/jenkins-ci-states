include:
  - projects.sorbic.virtualenv
  - pkgs.python.msgpack
  - pkgs.python.nose
  - pkgs.python.coverage
  - pkgs.python.salttesting
  - pkgs.python.unittest-xml-reporting


noop:
  test.succeed_without_changes
