# Create groups
class accounts::groups {

  $groups = hiera_hash(accounts::groups, {})
  if $groups {
    create_resources(group, $groups)
  }
}
