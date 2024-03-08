class accounts::params {
  $ensure     = 'present'
  $comment    = undef
  $gid        = undef
  $groups     = []
  $home       = undef
  $managehome = true
  $password   = undef
  $provider   = undef
  $shell      = undef
  $system     = false
  $uid        = undef
  $keys       = []
}

