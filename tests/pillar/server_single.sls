git:
  server:
    enabled: true
    directory: /srv/git
    repos:
      - name: gerritlib
        url: https://github.com/openstack-infra/gerritlib.git
nginx:
  server:
    enabled: True
    site:
      git_server:
        enabled: True
        name: git_server
        type: git
        root: /srv/git
        client_max_body_size: 0
        host:
          name: git.local
          port: 8080