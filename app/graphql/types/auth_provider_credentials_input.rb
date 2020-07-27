class Types::AuthProviderCredentialsInput < Types::BaseInputObject
  graphql_name 'AUTH_PROVIDER_CREDENTIALS'

  argument :email, String, required: true
  argument :password, String, required: true
end
