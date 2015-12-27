module RecommendationsHelper
  require 'net/http'
  require 'digest'
  
  def status_params
    ["有效", "关闭"]
  end
  
  def stage_params
    ["信息已提交", "联系候选人", "已推荐给HR", "已面试", "已发offer", "已入职", "入职金已发放"]
  end
  
  def send_sms(recommendation, step)
    recommender_name = recommendation.recommender.name
    recommendee_name = recommendation.recommendee.name
    company = recommendation.position.company.realname
    url = "http://dx.ipyy.net/sms.aspx"
    account = "xm000081"
    signature = "【荔枝咨询】"
    case step
      # 推荐关闭
      when 0 then content = "#{signature} #{recommender_name}，由于“#{recommendation.reason}”，您向“#{company}”推荐的“#{recommendee_name}”没有机会入职，我们看看其它适合的机会，如果能顺利入职也会有一笔感谢金给到您。" 
      # 提交推荐
      when 1 then content = "#{signature} #{recommender_name}，推荐信息已收到，你为他争取的机会，也许会改变一生，接下来，是我们的服务时间，推荐进展会短信通知你，请注意查收。"
      # 进入面试
      when 2 then content = "#{signature} #{recommender_name}2，推荐信息已收到，你为他争取的机会，也许会改变一生，接下来，是我们的服务时间，推荐进展会短信通知你，请注意查收。"
      # 入职
      when 3 then content = "#{signature} #{recommender_name}3，推荐信息已收到，你为他争取的机会，也许会改变一生，接下来，是我们的服务时间，推荐进展会短信通知你，请注意查收。"
      # 入职金已发放
      when 4 then content = "#{signature} #{recommender_name}4，推荐信息已收到，你为他争取的机会，也许会改变一生，接下来，是我们的服务时间，推荐进展会短信通知你，请注意查收。"
    end
    puts content
    mobile = recommendation.recommender.phone
    # mobile = "18018668022"
    password_orig = "lisainlz"
    password = Digest::MD5::hexdigest(password_orig).upcase
    
    begin
      res = Net::HTTP.post_form(URI.parse(url), action: 'send', userid: '', account: account, password: password, mobile: mobile, content: content, sendtime: '', extno: '')
      puts res.body
    rescue Exception => e
      puts "发送短信错误！#{e}"
    end
  end
end
