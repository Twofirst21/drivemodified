class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def create
    user = User.from_omniauth(env["omniauth.auth"]) ## Setting "user" here
    session[:user_id] = user.id  ## Changed this to use the set "user"
    redirect_to root_url
  end
end
