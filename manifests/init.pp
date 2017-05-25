# Manage users, groups and ssh keys
class accounts (
) {

  # See Readme.md for explanation of the {dirti,awesome}ness of this module.

  anchor { 'accounts::begin': } ->
  class  { 'accounts::groups': } ->
  class  { 'accounts::users': } ->
  class  { 'accounts::revoked': } ->
  anchor { 'accounts::end': }

}


