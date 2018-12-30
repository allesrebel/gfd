class ApplicationController < ActionController::Base
	include Passwordless::ControllerHelpers

  helper_method :current_user # Expose methods to 'views'

  # Home page, GET root
  def index
	end

  # GET oauth2 GET Handler
  def oauth2
    process_auth_hash request.env['omniauth.auth']
    redirect_to root_path
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

  def process_auth_hash(hash)
    # Check which kind of hash it is
    if hash[:provider] == "google_oauth2"
      @user = User.new email: hash[:extra][:id_info][:email] if hash[:extra][:id_info][:email_verified]
      @user = User.find_by_email @user.email unless @user.save
      sign_in @user
    end
  end
end
