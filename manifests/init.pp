# Manage users, groups and ssh keys
#
# See Readme.md for explanation of the {dirti,awesome}ness of this module.

class accounts {
  anchor { 'accounts::begin': }
  -> class  { 'accounts::groups': }
  -> class  { 'accounts::users': }
  -> class  { 'accounts::revoked': }
  -> anchor { 'accounts::end': }

}
