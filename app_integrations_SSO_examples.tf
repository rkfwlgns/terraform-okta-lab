# --- 1. SAML Application Example ---
resource "okta_app_saml" "sample_saml_app" {
  label              = "Sample SAML App"
  sso_url            = "https://example.com/sso/saml"
  recipient          = "https://example.com/sso/saml"
  destination        = "https://example.com/sso/saml"
  audience           = "https://example.com/sso/saml/metadata"
  subject_name_id_template = "${user.email}"
  subject_name_id_format   = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  response_signed    = true
  assertion_signed   = true
  signature_algorithm = "RSA_SHA256"
  digest_algorithm    = "SHA256"
  honor_force_authn   = true

  attribute_statements {
    name = "email"
    type = "EXPRESSION"
    value = "user.email"
  }
}

# --- 2. OIDC (OpenID Connect) Application Example ---
resource "okta_app_oauth" "sample_oidc_app" {
  label                   = "Sample OIDC App"
  type                    = "web"
  grant_types             = ["authorization_code", "refresh_token"]
  redirect_uris           = ["https://example.com/oauth2/callback"]
  response_types          = ["code"]
  post_logout_redirect_uris = ["https://example.com/logout/callback"]
  client_uri              = "https://example.com"
  logo_uri                = "https://example.com/logo.png"
  tos_uri                 = "https://example.com/tos"
  policy_uri              = "https://example.com/policy"
  consent_method          = "REQUIRED"
}

# --- 3. SWA (Secure Web Authentication) Application Example ---
resource "okta_app_swa" "sample_swa_app" {
  label          = "Sample SWA App"
  button_field   = "btn-login"
  url            = "https://example.com/login"
  username_field = "username"
  password_field = "password"
  login_url_regex = "https://example.com/login.*"
}