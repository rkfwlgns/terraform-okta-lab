hcl

#this script configures the Okta provider so that it knows how to interact with Okta

terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      }
    }
  }

#create the custom application in okta. collect clientID and generate new secret.
#download the .pem version, then convert into an RSA key.
###openssl rsa -in <path_to_.pem> -out <rsa.pem>
#

#configure the okta provider
provider "okta" {
  org_name  = "<your_okta_org_name>"
  base_url  = "okta.com"
  api_token = "<your_okta_api_token>"
  client_id = "<clientID>"
  private_key = "${path.module}/rsa.pem"
}

#data source for the Okta Dashboard app
data "okta_app" "okta_dashboard" {
  label = "Okta Dashboard"
}

#use the resource command to change attributes
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

resource "okta_group" "friends" {
  name = "friends"
  description = "created by Terraform."  
}


#run terraform init to intialize the .tf file and validate the providers
#if this fails, double check the attributes
terraform init

#run terraform plan to stage the changes you want to make to the infrastructure
terraform plan 

#once you review the changes, accept the changes by entering yes
terraform apply
