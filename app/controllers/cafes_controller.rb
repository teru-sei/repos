class CafesController < ApplicationController
  def index
  end

  def new
    @cafe = Cafe.new
  end

  def create
    
    @cafe = Cafe.create(cafe_params)
    if @cafe.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def cafe_params
    params.permit(:image, :name, :address, :URL, :recommend, :purpose_id, :prefecture_id).merge(user_id: current_user.id)
  end
end
