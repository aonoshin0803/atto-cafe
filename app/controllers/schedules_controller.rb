class SchedulesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @schedules = Schedule.all.order(join_date: :asc)
  end
  
  def show
  end
  
  def new
    @schedule = Schedule.new
    @user = User.find_by(id: params[:user_id])
    @shop = Shop.find_by(id: params[:shop_id])
  end
  
  def create
    @user = User.find_by(id: params[:user_id])
    @shop = Shop.find_by(id: params[:shop_id])
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = "スケジュールに追加しました！"
      redirect_to "/users/#{@schedule.user_id}"
    else
      flash[:alert] = "入力内容に誤りがあります。"
      redirect_to "/shops/#{@shop.id}/schedules/new"
    end
  end
  
  
  def edit
    @user = User.find_by(id: params[:user_id])
    @shop = Shop.find_by(id: params[:shop_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.user_id == current_user.id
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/users/#{@user.id}"
    end
  end
  
  def update
    @user = User.find_by(id: params[:user_id])
    @shop = Shop.find_by(id: params[:shop_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = "編集しました！"
      redirect_to "/users/#{current_user.id}"
    else
      flash[:alert] = "入力内容に誤りがあります。"
      redirect_to "/shops/#{@shop.id}/schedules/#{@schedule.id}/edit"
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @user = User.find_by(id: params[:user_id])
    if @schedule.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/users/#{@schedule.user_id}"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/users/#{@user.id}"
    end
  end
  
  private
    def schedule_params
      params.require(:schedule).permit(:join_date, :start_time, :end_time, :content, :shop_id, :user_id).merge(user_id: current_user.id, shop_id: @shop.id)
    end
  
  
end
