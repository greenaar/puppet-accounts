# virtual resource to create a local user

define accounts::functions::virtual(
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

  # Might be that the $pass field is present in hiera but empty.
  # This would allow passwordless login. Fix this.
  if $pass == '' {
    $pass='!'
  }

  if $ensure == 'absent' {
    accounts::functions::term{$title: }
  }

  user { $title:
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
  }

  if !defined(File["${home}/.ssh"]) {
    file { "${home}/.ssh":
      ensure  => directory,
      owner   => $title,
      mode    => '0700',
      path    => "${home}/.ssh",
      require => User[$title],
    }
  }

  if $keys {
    file { "${home}/.ssh/authorized_keys":
      ensure  => file,
      owner   => $title,
      mode    => '0600',
      content => template("${module_name}/authorized_keys.erb"),
      require => File["${home}/.ssh"],
    }
  } else {
    file { "${home}/.ssh/authorized_keys":
      ensure => absent,
    }
  }
}
