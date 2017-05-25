# Accounts

put all of your users into a top level yaml. They will not get activated 
unless role matches.  Most of the options are just that, optional.

```
common.yaml 
---
classes:
  - accounts

accounts::users:
  edward:
    ensure: present
    comment: 'Edward Bear'
    gid: 4000 # note gid must exist
    groups:
      - users
      - sudo
    home: '/home/edward'
    managehome: true
    # python -c 'import crypt; print crypt.crypt("passwerd", "$6$some_random_salt")'
    password: '$passwordhash'
    shell: '/bin/bash'
    system: false # is this a system user?
    uid: 4000
    keys:
      - 'ssh-rsa <LONG STRING>'
      - 'ssh-rsa <LONG STRING>'
    roles:
      - dev
      - ops

# to remove a user, do something like the following (make sure to remove them from any roles)
accounts::revoked:
 - joe


# to add a group of users to a box, do the following, substituting roles where required.

accounts:::roles:
  - 'dev'

```
