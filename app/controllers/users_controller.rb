class UsersController < ApplicationController

  # GET on profile
  def profile
    require_user!
  end

  # For POST operations
  def create
    @user = User.new user_params

    if @user.save
      redirect_to auth.sign_in_path( passwordless_id: params(:email), flash: {notice: 'Please sign in to access content!'} )
    else  # Failed to save USER, error
      redirect_to register_path(email: params[:email], error: @user.errors.any?)
    end
  end

  private

  # Validate the Parameters that were passed in
  def user_params
    params.permit(:email)
  end

end