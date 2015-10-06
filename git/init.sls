{%- if pillar.git is defined %}
include:
{%- if pillar.git.client is defined %}
- git.client
{%- endif %}
{%- endif %}