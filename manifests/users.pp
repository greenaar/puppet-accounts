# Create users
class accounts::users () {

  $users = lookup({
                      'name'          => 'accounts::users',
                      'default_value' => {}
                      })
  if $users {
    create_resources('@accounts::functions::add_virtual', $users)
  }

  $roles = lookup({
                      'name'          => 'accounts::roles',
                      'default_value' => []
                      }).reduce({}) | $accumulator, $x| {
                          merge ( $accumulator, {
                            "${x}" => {
                              'type' => 'roles'
                            }
                          }
                        )
  }
  if $roles {
    create_resources('accounts::functions::roles', $roles)
  }
}
