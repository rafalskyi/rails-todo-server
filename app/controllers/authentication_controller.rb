class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:authenticate, :authenticate_social]

  # return auth token once user is authenticated
  def authenticate
    auth_user =
      AuthenticateUser.new(auth_params[:email], auth_params[:password]).call

    json_response(auth_user)
  end

  # return auth token once user is authenticated
  def authenticate_social
    user = User.find_or_create_from_auth_hash(social_auth_params)
    auth_user = AuthenticateUser.new(user.email, user.password).call if user
    json_response(auth_user)
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

  def social_auth_params
    params.permit(:email, :name, :provider, :uid, :image)
  end
end
