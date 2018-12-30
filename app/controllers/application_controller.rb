class ApplicationController < ActionController::Base
	include Passwordless::ControllerHelpers

  helper_method :current_user

  def index
	end

  def register
    redirect_to profile_path, flash: {notice: 'You are already signed in!'} if current_user
  end

  private
  
  def current_user
    @current_user ||= authenticate_by_cookie(User)
  end

  def require_user!
    return if current_user
    redirect_to auth.sign_in_path, flash: {error: 'Please Sign In'}
  end
end
