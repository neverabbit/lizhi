class StaticThemesController < ApplicationController
  require 'digest/sha1'
  
  def home
    @customer = Customer.new
  end

  def contact
  end
  
  def business
    @customer = Customer.new
  end
  
  def intro
  end
  
  def recruit
  end
  
  def wechat
    signature = wechat_params[:signature]
    timestamp = wechat_params[:timestamp]
    nonce = wechat_params[:nonce]
    echostr = wechat_params[:echostr]
    
    token = 'vincentinlz2015'
    
    tmpStr = [token, timestamp, nonce].sort.join
    tmpStr = Digest::SHA1.hexdigest tmpStr
    if signature == tmpStr
      @output = echostr
    else
      @output = ''
    end
  end
  
  private 
  
    def wechat_params
      params.permit(:signature, :timestamp, :nonce, :echostr)
    end 

end
