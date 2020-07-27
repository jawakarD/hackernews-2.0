class Mutations::CreateUser < Mutations::BaseMutation
  class AuthProviderSignupData < Types::BaseInputObject
    argument :credentials, Types::AuthProviderCredentialsInput, required: true
  end

  argument :name, String, required: true
  argument :auth_provider, AuthProviderSignupData, required: true

  field :user, Types::UserType, null: false

  def resolve(name: nil, auth_provider: nil)
    {user:
       User.create!(
        name: name,
        email: auth_provider&.[](:credentials)&.[](:email),
        password_digest: auth_provider&.[](:credentials)&.[](:password)
      )
    }
  end
end
