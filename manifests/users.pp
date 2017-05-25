# Create users
class accounts::users () {

  $users=hiera_hash(accounts::users, {})

  create_resources('@accounts::functions::add_virtual', $users)

  $roles = hiera_array(accounts::roles, []).reduce({}) |$accumulator, $x| {
    merge ($accumulator, {"${x}" =>  {'type' => 'roles'}})
  }

  create_resources('accounts::functions::roles', $roles)
}
