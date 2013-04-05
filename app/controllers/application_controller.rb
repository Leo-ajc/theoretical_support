class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user!
    if !current_user
      redirect_to login_url, :alert => 'You need to sign in for access to this page.'
    end
  end

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

end
