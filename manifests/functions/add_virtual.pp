#

define accounts::functions::add_virtual(
  $ensure     = $accounts::params::ensure,
  $comment    = $accounts::params::comment,
  $gid        = $accounts::params::gid,
  $groups     = $accounts::params::groups,
  $home       = $accounts::params::home,
  $managehome = $accounts::params::managehome,
  $password   = $accounts::params::password,
  $provider   = $accounts::params::provider,
  $shell      = $accounts::params::shell,
  $system     = $accounts::params::system,
  $uid        = $accounts::params::uid,
  $keys       = $accounts::params::keys,
  $roles      = undef,
  ) {
    # Thanks to defined, a user will be created only once,
    # preventing double resource creation which is verboten by puppet.
  unless defined (Accounts::Functions::Virtual[$title]) {
    accounts::functions::virtual{$title:
      ensure     => $ensure,
      comment    => $comment,
      gid        => $gid,
      groups     => $groups,
      home       => $home,
      managehome => $managehome,
      password   => $password,
      provider   => $provider,
      shell      => $shell,
      system     => $system,
      uid        => $uid,
      keys       => $keys,
    }
  }
}

