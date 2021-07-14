class CafesController < ApplicationController
  before_action :set_user

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

  def search
    set_search
  end

  def show
    @cafe = Cafe.find(params[:id])
  end

  def edit
  end
  
  private

  def cafe_params
    params.permit(:image, :name, :address, :URL, :recommend, :purpose_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def set_user
    @user = current_user
  end

  def set_search
    if  params[:region] == "1"
      @cafe = Cafe.where(prefecture_id: [14])
      @region = "東京"
    elsif params[:region] == "2"
      @cafe = Cafe.where(prefecture_id: [2])
      @region = "北海道"
    elsif params[:region] == "3"
      @cafe = Cafe.where(prefecture_id: [3..8])
      @region = "東北地方"
    elsif params[:region] == "4"
      @cafe = Cafe.where(prefecture_id: [9..15])
      @region = "関東地方"
    elsif params[:region] == "5"
      @cafe = Cafe.where(prefecture_id: [16..24])
      @region = "中部地方"
    elsif params[:region] == "6"
      @cafe = Cafe.where(prefecture_id: [25..31])
      @region = "関西地方"
    elsif params[:region] == "7"
      @cafe = Cafe.where(prefecture_id: [32..36])
      @region = "中国地方"
    elsif params[:region] == "8"
      @cafe = Cafe.where(prefecture_id: [37..40])
      @region = "四国地方"
    elsif params[:region] == "9"
      @cafe = Cafe.where(prefecture_id: [41..48])
      @region = "九州地方"
    elsif params[:genre] == "1"
      @cafe = Cafe.where(purpose_id: [2])
      @purpose = "コーヒー"
    elsif params[:genre] == "2"
      @cafe = Cafe.where(purpose_id: [3])
      @purpose = "紅茶"
    elsif params[:genre] == "3"
      @cafe = Cafe.where(purpose_id: [4])
      @purpose = "スイーツ"
    elsif params[:genre] == "4"
      @cafe = Cafe.where(purpose_id: [5])
      @purpose = "オシャレ"
    else
      render :index
    end
  end
end
