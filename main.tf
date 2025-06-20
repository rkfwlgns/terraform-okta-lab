terraform {
  required_providers {
    okta = {
      source = "okta/okta"
      version = "4.20.0"
      }
    }
  }

#configure the okta provider
provider "okta" {
  org_name = "trial-3330090"
  base_url = "okta.com"
  client_id= "0oasipkhucLxy4RCR697"
  scopes = ["okta.groups.manage", "okta.users.manage", "okta.policies.manage"]
  private_key = "${path.module}/pem.pem"
}

#run terraform init to intialize the .tf file and validate the providers
#if this fails, double check the attributes
#terraform init

#run terraform plan to stage the changes you want to make to the infrastructure
#terraform plan 

#once you review the changes, accept the changes by entering yes
#terraform apply
