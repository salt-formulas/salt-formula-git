{%- from "git/map.jinja" import server with context %}

{%- if server.enabled %}

git_packages:
  pkg.installed:
  - names: {{ server.pkgs }}

{{ server.directory }}:
  file.directory:
    - user: www-data
    - group: www-data
    - dir_mode: 755
    - file_mode: 644

{%- for repo in server.get('repos',{}) %}

{%- if repo.url is defined %}

git_server_{{ repo.name }}:
  git.latest:
    - name: {{ repo.url }}
    - target: {{ server.directory }}/{{ repo.name }}.git
    - force_reset: True
    - mirror: True
    - require:
        - file: {{ server.directory }}

{%- else %}

git_server_{{ repo.name }}:
  git.present:
    - name: {{ server.directory }}/{{ repo.name }}.git
    - force: True
    - bare: True
    - require:
        - file: {{ server.directory }}

{%- endif %}

git_update_server_info_{{ repo.name }}:
  cmd.run:
    - name: git update-server-info
    - cwd: {{ server.directory }}/{{ repo.name }}.git
    - require:
        - git: git_server_{{ repo.name }}

{%- endfor %}
{%- endif %}