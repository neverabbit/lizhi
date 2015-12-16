class WechatsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :check_wechat_legality

  def show
    render :text => params[:echostr]
  end

  def create
    if params[:xml][:MsgType] == "text"
      render "echo", :formats => :xml
    end
  end

  private
  # 根据参数校验请求是否合法，如果非法返回错误页面
    def check_wechat_legality
      array = [Rails.configuration.wechat_token, params[:timestamp], params[:nonce]].sort
      render :text => "Forbidden", :status => 403 if params[:signature] != Digest::SHA1.hexdigest(array.join)
    end
end
