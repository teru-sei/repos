class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cafe = @user.cafes
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to user_path
    else
      render :edit
    end
  end

  def user_params
    params.permit(:nickname, :email, :password, :profile)
  end
end
