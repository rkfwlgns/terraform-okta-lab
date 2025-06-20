resource "okta_user" "example" {
  login = "john.doe@example.com"
  first_name = "John"
  last_name = "Doe"
  email = "john.doe@example.com"
}

resource "okta_user" "example2" {
  login = "jane.smith@example.com"
  first_name = "Jane"
  last_name = "Smith"
  email = "jane.smith@example.com"
}

resource "okta_user" "example3" {
  login = "peter.jones@example.com"
  first_name = "Peter"
  last_name = "Jones"
  email = "peter.jones@example.com"
}
