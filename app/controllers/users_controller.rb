class UsersController < ApplicationController

  # For POST operations
  def create
    @user = User.new user_params

    if @user.save or @user.errors.messages[:email] == ["has already been taken"]
      redirect_to auth.sign_in_path( email: @user.email, success: true )
    else  # User had other errors
      redirect_to register_path(email: params[:email], error: @user.errors.any?)
    end
  end

  private

  # Valid User Parameters to create a User active Record
  def user_params
    params.permit(:email)
  end

end 