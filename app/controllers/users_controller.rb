class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @cafe = @user.cafes
  end

  def edit
    @user = User.find(params[:id])
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

  def move_to_index
    if current_user == @user
      redirect_to root_path
    end
  end
end
