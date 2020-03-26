class InquiriesController < ApplicationController
    
    before_action :admin_check_redirect, only: [:index]
    
    def index
        if user_signed_in?
            if current_user.id == 0
                @inquiries = Inquiry.all.order(created_at: :desc)
            else
                @inquiries = Inquiry.where(user_id: current_user.id)
            end
        else
            flash[:alert] = "閲覧権限がありません"
            redirect_to root_path
        end
    end
    
    def show
        @inquiry = Inquiry.find(params[:id])
        @answers = Answer.where(inquiry_id: @inquiry.id)
    end
    
    def new
        @inquiry = Inquiry.new
    end
    
    def create
        @inquiry = Inquiry.new(inquiry_params)
        respond_to do |format|
            if @inquiry.save
                InquiryMailer.send_when_create(@inquiry).deliver
                InquiryMailer.send_when_create_admin(@inquiry).deliver
                if user_signed_in?
                    format.html { redirect_to "/users/#{current_user.id}", notice: 'お問合せを受付ました。' }
                else
                    format.html { redirect_to "/", notice: 'お問合せを受付ました。' }
                end
                format.html { redirect_to inquiries_path, notice: 'お問合せ受付ました' }
                format.json { render "inquiries/new", status: :created, location: @inquiry }
            else
                format.html { render "inquiries/new", alert: '入力内容に誤りがあります。' }
                format.json { render json: @inquiry.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @inquiry = Inquiry.find(params[:id])
        if @inquiry.destroy
            flash[:notice] = "削除しました！"
            redirect_to "/inquiries"
        else
            flash[:alert] = "削除できませんでした。"
            redirect_to "/inquiries/#{@inquiry.id}"
        end
    end
    
    private
      def inquiry_params
          if user_signed_in?
              params.require(:inquiry).permit(:name, :content, :email, :user_id).merge(user_id: current_user.id)
          else
              params.require(:inquiry).permit(:name, :content, :email)
          end
      end
    
end
