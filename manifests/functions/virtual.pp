# virtual resource to create a local user

define accounts::functions::virtual(
  $ensure     = present,
  $comment    = undef,
  $gid        = undef,
  $groups     = undef,
  $home       = "/home/${title}",
  $managehome = true,
  $password   = undef,
  $provider   = undef,
  $shell      = '/bin/bash',
  $system     = false,
  $uid        = undef,
  $keys       = undef,
  $roles      = undef,
  ) {

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

  if $keys {
    if !defined(File["${home}/.ssh"]) {
      file { "${home}/.ssh":
        ensure  => directory,
        owner   => $title,
        mode    => '0700',
        path    => "${home}/.ssh",
        require => User[$title],
      }
    }

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
