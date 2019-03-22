# Terminate any processes owned by the revoked user.

define accounts::functions::term (
  $deleted = $title,
) {
  exec { "term ${deleted}":
    command => "pkill -9 -u ${deleted}",
    onlyif  => "grep '^${deleted}' /etc/passwd && ps -u ${deleted}",
    before  => User[$deleted],
  }
}
