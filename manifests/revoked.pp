# Remove users

class accounts::revoked () {

  $deleted = hiera_array(accounts::revoked, [])

  accounts::functions::term{$deleted: }

  user { $deleted:
    ensure     => absent,
    managehome => true,
  }

}
