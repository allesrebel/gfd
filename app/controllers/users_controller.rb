class UsersController < ApplicationController

  # GET on profile
  def profile
    require_user!
  end

  # For POST operations
  def create
    @user = User.new user_params
    
    if @user.save
      redirect_to auth.sign_in_path, flash: {notice: 'Registered user, welcome!'}
    else  # Failed to save USER
      redirect_to auth.sign_in_path, flash: {notice: 'User exists, please authenticate!'}
    end
  end

  private

  # Validate the Parameters that were passed in
  def user_params
    params.permit(:email)
  end

end