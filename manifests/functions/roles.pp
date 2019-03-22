# Manage roles

define accounts::functions::roles($type) {
  if $title == 'all' {
    Accounts::Functions::Add_virtual <| |>
  } else {
    Accounts::Functions::Add_virtual <| roles == $title |>
  }
}
