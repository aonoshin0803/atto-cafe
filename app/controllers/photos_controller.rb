class PhotosController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @photos = Photo.where(shop_id: params[:shop_id])
  end
  
  def show
    @photo = Photo.find(params[:id])
    @shop = Shop.find_by(id: params[:shop_id])
  end
  
  def new
    @photo = Photo.new
    @user = User.find_by(id: params[:user_id])
    @shop = Shop.find_by(id: params[:shop_id])
  end
  
  def create
    @shop = Shop.find_by(id: params[:shop_id])
    @photo = Photo.new(photo_params)
    if @photo.save
      logger.debug("==================== image = #{@photo.image}")
      flash[:notice] = "新規作成しました！"
      redirect_to "/shops/#{@shop.id}/photos/#{@photo.id}"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/shops/#{@shop.id}/photos/new"
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/shops/#{@shop.id}"
    end
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      flash[:notice] = "編集しました！"
      redirect_to "/shops/#{@shop.id}/photos/#{@photo.id}"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/shops/#{@shop.id}/photos/#{@photo.id}/edit"
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @shop = Shop.find_by(id: params[:shop_id])
    if @photo.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/shops/#{@shop.id}"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/photos/#{@photo.id}"
    end
  end
  
  private
    def photo_params
      params.require(:photo).permit(:image, :user_id, :shop_id).merge(shop_id: @shop.id, user_id: current_user.id)
    end
  
end
