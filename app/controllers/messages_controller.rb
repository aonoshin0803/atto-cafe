class MessagesController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @messages = Message.where("(from_id = ?) OR (to_id = ?)", current_user.id, current_user.id).order(created_at: :desc)
    @user = User.find_by(id: params[:user_id])
  end
  
  def show
    @message = Message.find(params[:id])
    @user = User.find_by(id: params[:user_id])
  end
  
  def new
    @message = Message.new
    @user = User.find_by(id: params[:user_id])
  end
  
  def create
    @user = User.find_by(id: params[:user_id])
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "メッセージを送信しました！"
      redirect_to "/users/#{current_user.id}/messages"
    else
      flash[:alert] = "入力内容に誤りがあります。"
      redirect_to "/users/#{@user.id}/messages/new"
    end
  end
  
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      flash[:notice] = "削除しました！"
      redirect_to "/users/#{current_user.id}/messages"
    else
      flash[:alert] = "削除できませんでした。"
      redirect_to "/users/#{current_user.id}/messages"
    end
  end
  
  private
    def message_params
      params.require(:message).permit(:title, :content, :from_id, :to_id, :user_id).merge(from_id: current_user.id, to_id: @user.id, user_id: current_user.id)
    end
  
end
