module RecommendationsHelper
  require 'net/http'
  require 'digest'
  
  def status_params
    ["有效", "关闭"]
  end
  
  def stage_params
    ["初步评估", "沟通中", "推荐给HR", "已面试", "已发offer", "已入职", "入职金已发放"]
  end
  
  def send_sms(phone, name, stage)
    url = "http://dx.ipyy.net/sms.aspx"
    account = "xm000081"
    signature = "【荔枝咨询】"
    case stage
      when stage_params[0] then content = "#{signature} #{name}，推荐信息已收到，你为他争取的机会，也许会改变一生，接下来，是我们的服务时间，推荐进展会短信通知你，请注意查收。"
      # when stage_params[1] then content = ""
      when stage_params[5] then content = ""
    end
    
    mobile = phone
    # mobile = "18018668022"
    password_orig = "lisainlz"
    password = Digest::MD5::hexdigest(password_orig).upcase
    
    begin
      res = Net::HTTP.post_form(URI.parse(url), action: 'send', userid: '', account: account, password: password, mobile: mobile, content: content, sendtime: '', extno: '')
      puts res.body
    rescue Exception => e
      return "发送短信错误！#{e}"
    end
  end
end
