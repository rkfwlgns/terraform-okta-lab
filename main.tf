hcl
#configure the okta provider
provider "okta" {
  org_name  = "<your_okta_org_name>"
  base_url  = "okta.com"
  api_token = "<your_okta_api_token>"
}

#data source for the Okta Dashboard app
data "okta_app" "okta_dashboard" {
  label = "Okta Dashboard"
}

resource "okta_user" "alex.kal" {
  first_name = "Alex"
  last_name  = "Kal"
  email      = "Alex.Kal@okta_test.com"
  login      = "Alex.Kal@okta_test.com"
}

resource "okta_group_memberships" "admin_membership" {
  group_id = okta_group.admin_membership.id
  users    = [okta_user.alex.kal.id]
}

terraform init
terraform plan 
terraform apply
