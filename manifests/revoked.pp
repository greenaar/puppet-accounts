# Remove users

class accounts::revoked () {

  $deleted = lookup({
                            'name'          => 'accounts::revoked',
                            'default_value' => []
                          })

  if $deleted {
    accounts::functions::term{ $deleted: }
    user { $deleted:
      ensure     => absent,
      managehome => true,
    }
  }
}
