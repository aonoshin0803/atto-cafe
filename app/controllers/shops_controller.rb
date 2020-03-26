class ShopsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @shops = Shop.all.order(updated_at: :desc)
  end
  
  def show
    @shop = Shop.find(params[:id])
    @photos = Photo.where(shop_id: @shop.id).order(created_at: :desc)
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "新規作成しました！"
      redirect_to "/shops/#{@shop.id}"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/shops/new"
    end
  end
  
  def edit
    @shop = Shop.find(params[:id])
    if @shop.user_id == current_user.id
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/shops"
    end
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "編集しました！"
      redirect_to "/shops/#{@shop.id}"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/shops/#{@shop.id}/edit"
    end
  end
  
  def destroy
    @shop = Shop.find(params[:id])
    if @shop.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/shops"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/shops/#{@shop.id}"
    end
  end
  
  private
    def shop_params
      params.require(:shop).permit(:name, :image, :place, :start_time, :end_time, :wifi, :outlet, :gender_man, :gender_woman, :wide, :staff, :beans, :food, :quietness, :congestion, :other, :user_id).merge(user_id: current_user.id)
    end
  
end
