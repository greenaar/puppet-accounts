# Remove users

class accounts::revoked () {

  $deleted = hiera_array(accounts::revoked, [])

  if $deleted {
    accounts::functions::term{ $deleted: }
    user { $deleted:
      ensure     => absent,
      managehome => true,
    }
  }
}
