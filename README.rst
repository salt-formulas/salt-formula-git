
===========
Git formula
===========

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

Sample pillars
==============

.. code-block:: yaml

Simplest GIT setup

    git:
      client:
        enabled: true

GIT with user setup

.. code-block:: yaml

    git:
      client:
        enabled: true
        user:
        - user:
            name: jdoe
            email: j@doe.com

Reclass with GIT with user setup

.. code-block:: yaml

    git:
      client:
        enabled: true
        user:
        - user: ${linux:system:user:jdoe}

Read more
=========

* http://git-scm.com/
* http://git-scm.com/book/en/Customizing-Git-Git-Configuration
* https://github.com/nesi/puppet-git/tree/master/manifests
