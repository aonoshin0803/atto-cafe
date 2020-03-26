class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(updated_at: :desc)
  end
  
  def show
    @user = User.find(params[:id])
    @schedules = Schedule.where(user_id: @user.id).order(join_date: :asc)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
      flash[:alert] = "無効なユーザー"
      redirect_to "/users/#{@user.id}"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集しました！"
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = "入力に誤りがあります。"
      redirect_to "/users/#{@user.id}/edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "退会が完了しました！"
      redirect_to "/"
    else
      flash[:alert] = "退会に失敗しました。"
      redirect_to "/users/#{@user.id}"
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :gender, :age, :image, :work, :content)
    end
  
  
end
