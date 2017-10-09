{%- if pillar.git is defined %}
include:
{%- if pillar.git.client is defined %}
- git.client
{%- endif %}
{%- if pillar.git.server is defined %}
- git.server
{%- endif %}
{%- endif %}