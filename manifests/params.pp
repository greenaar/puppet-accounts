#

class accounts::params {

  $ensure     = present
  $comment    = undef
  $gid        = undef
  $groups     = ['users']
  $home       = "/home/${title}"
  $managehome = true
  $password   = undef
  $provider   = undef
  $shell      = '/bin/bash'
  $system     = undef
  $uid        = undef
  $keys       = []
}
