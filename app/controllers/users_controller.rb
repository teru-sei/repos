class UsersController < ApplicationController
  def show
    @user = current_user
    @cafe = @user.cafes
  end
end
