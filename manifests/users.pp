# Create users
class accounts::users () {

  $users=hiera(accounts::users, {})
  if $users {
    create_resources('@accounts::functions::add_virtual', $users)
  }

  $roles = hiera_array(accounts::roles, []).reduce({}) |$accumulator, $x| {
    merge ($accumulator, {"${x}" =>  {'type' => 'roles'}})
  }
  if $roles {
    create_resources('accounts::functions::roles', $roles)
  }
}
