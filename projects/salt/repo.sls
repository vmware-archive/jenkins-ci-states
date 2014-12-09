{% set repo_clone_dir = pillar.get('repo_clone_dir', '/testing') %}
{% set repo_clone_rev =  pillar.get('repo_clone_rev', 'develop') %}
{% set repo_clone_url =  pillar.get('repo_clone_url', 'https://github.com/saltstack/salt.git') %}

create-repo-clone-dir:
  file.directory:
    - name: {{ repo_clone_dir }}

clone:
  git.latest:
    - name: {{ repo_clone_url }}
    - rev: {{ repo_clone_rev }}
    - target: {{ repo_clone_dir }}
    - require:
      - file: create-repo-clone-dir

{% if repo_clone_url != "https://github.com/saltstack/salt.git" %}
{#- Add Salt Upstream Git Repo #}
add-upstream-repo:
  cmd.run:
    - name: git remote add upstream https://github.com/saltstack/salt.git
    - cwd: /testing
    - require:
      - git: clone

{# Fetch Upstream Tags -#}
fetch-upstream-tags:
  cmd.run:
    - name: git fetch upstream --tags
    - cwd: /testing
    - require:
      - cmd: add-upstream-repo
{% endif %}
