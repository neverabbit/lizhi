class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :new]
  before_action :correct_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "欢迎加入!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def admin_positions
    @user = User.find(params[:id])
    @positions = Position.order('created_at DESC').where("consultant LIKE ?", @user.name).paginate(page: params[:page])
  end
  
  private
    def user_params 
      params.require(:user).permit(:phone, :name, :email, :city, :quality, :position, :start_year, :birthday, :gender, :marriage, :hometown, :salary, :password, :password_confirmation)
    end
    
    # def logged_in_user
    #   unless logged_in?
    #     flash[:danger] = "请先登录！"
    #     redirect_to loginlz_url
    #   end
    # end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
