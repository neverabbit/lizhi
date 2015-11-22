class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(phone: params[:session][:phone]) 
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = '手机号或密码不正确！'
      render 'new' 
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
