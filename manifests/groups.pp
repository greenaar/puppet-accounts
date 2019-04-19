# Create groups
class accounts::groups {

  $groups = lookup({
                    'name'          => 'accounts::groups',
                    'default_value' => {}
                  })
  if $groups {
    create_resources(group, $groups)
  }
}
