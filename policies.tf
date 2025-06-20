
# 1. MFA Policy (OIE-enabled)
resource "okta_policy_mfa" "phishing_resistant" {
  name        = "Phishing-Resistant-MFA"
  description = "Okta Verify enforcement"
  status      = "ACTIVE"
  is_oie      = true

  okta_verify = {
    enroll = "REQUIRED"
  }
}

# 2. Session Policy
resource "okta_policy_signon" "zero_trust" {
  name            = "Zero-Trust-Session"
  status          = "ACTIVE"
  priority        = 1
  session_idle    = 60    # 1-hour idle timeout
  session_lifetime = 7200 # 2-hour max session
}

# 3. Policy Rule with Valid Arguments
resource "okta_policy_rule_signon" "risk_based" {
  policy_id  = okta_policy_signon.zero_trust.id
  name       = "Risk-Based-Auth"
  priority   = 1
  access     = "ALLOW"
  mfa_required = true
  mfa_prompt = "SESSION"
  
  # Valid arguments only:
  #reauthentication_frequency = "PT30M" # Require re-auth every 30 minutes
  network_connection         = "ANYWHERE"
  user_identifier            = "trial-3330090.com"
}

# 4. Security Admin Group
resource "okta_group" "security_admins" {
  name        = "Security-Admins"
  description = "Group for security administrators"
}