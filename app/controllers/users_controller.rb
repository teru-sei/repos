class UsersController < ApplicationController
  def show
    @cafe = current_user.cafes
  end
end
