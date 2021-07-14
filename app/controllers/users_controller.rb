class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cafe = @user.cafes
  end

  def edit
  end
end
