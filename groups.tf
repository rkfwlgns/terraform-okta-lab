# Create Okta Groups
resource "okta_group" "employees" {
  name        = "Employees"
  description = "All employees in the organization"
}

resource "okta_group" "contractors" {
  name        = "Contractors"
  description = "All contractors and temporary workers"
}

resource "okta_group" "it_team" {
  name        = "IT Team"
  description = "Information Technology department"
}

resource "okta_group" "security_admins" {
  name        = "Security Admins"
  description = "Security administrators with elevated privileges"
}

resource "okta_group" "business_technology" {
  name        = "Business Technology"
  description = "Business technology users and stakeholders"
}

resource "okta_group" "hr_team" {
  name        = "HR Team"
  description = "Human Resources department"
}

resource "okta_group" "finance_team" {
  name        = "Finance Team"
  description = "Finance and accounting department"
}

resource "okta_group" "executives" {
  name        = "Executives"
  description = "Executive leadership team"
}