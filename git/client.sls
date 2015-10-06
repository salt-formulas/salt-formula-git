{%- from "git/map.jinja" import client with context %}
{%- from "linux/map.jinja" import system with context %}
{%- if client.enabled %}

include:
- linux.system.user

git_packages:
  pkg.installed:
  - names: {{ client.pkgs }}

{%- for user in client.user %}

set_git_{{ user.user.name }}_param_username:
  cmd.run:
  - name: sudo -u {{ user.user.name }} -H git config --global user.name "{{ user.user.get('full_name', user.user.name) }}"
  - cwd: ~
  - require:
    - user: system_user_{{ user.user.name }}

{%- if user.user.email is defined %}

set_git_{{ user.user.name }}_param_email:
  cmd.run:
  - name: sudo -u {{ user.user.name }} -H git config --global user.email "{{ user.user.email }}"
  - cwd: ~
  - require:
    - user: system_user_{{ user.user.name }}

{%- endif %}

{%- endfor %}

{%- endif %}