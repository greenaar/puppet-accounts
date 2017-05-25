# Create groups
class accounts::groups () {

  $groups = hiera_hash(accounts::groups, {})
  create_resources(group, $groups)

}
