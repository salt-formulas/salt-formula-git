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
  git.config_set:
  - user: {{ user.user.name }}
  - name: user.name
  - value: "{{ user.user.get('full_name', user.user.name) }}"
  - global: True
  - require:
    - user: system_user_{{ user.user.name }}

{%- if user.user.email is defined %}

set_git_{{ user.user.name }}_param_email:
  git.config.set:
  - user: {{ user.user.name }}
  - name: user.email
  - value: "{{ user.user.email }}"
  - global: True
  - require:
    - user: system_user_{{ user.user.name }}

{%- endif %}

{%- if client.disable_ssl_verification == True %}

set_git_ssl_verification_off:
  git.config.set:
  - user: {{ user.user.name }}
  - name: http.sslVerify
  - value: "false"
  - global: True
  - require:
    - user: system_user_{{ user.user.name }}

{%- endif %}

{%- endfor %}

{%- endif %}
