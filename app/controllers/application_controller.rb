class ApplicationController < ActionController::Base
	include Passwordless::ControllerHelpers

  helper_method :current_user # Expose methods to 'views'

  # Home page, GET root
  def index
	end

  # Profile page, GET
  def profile
    require_user!
  end

  # Register a profile via GET
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
