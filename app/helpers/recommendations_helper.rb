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
    recommender = recommendation.recommender.name
    recommender_name = recommender.length > 5 ? recommender[0, 3]+'..' : recommender
    recommendee = recommendation.recommendee.name
    recommendee_name = recommendee.length > 5 ? recommendee[0, 3]+'..' : recommendee
    company = recommendation.position.company.name
    company_name = company.length > 15 ? company[0, 13]+'..' : company
    position = recommendation.position.name
    position_name = position.length > 10 ? position[0,8]+'..' : position
    url = "http://dx.ipyy.net/sms.aspx"
    account = "xm000081"
    signature = "【荔枝咨询】"
    case step
      # 推荐关闭
      when 0 then content = "#{signature} 因#{company_name}的#{position_name}已关闭，您推荐的#{recommendee_name}，没有机会进入下一环节，我们会向其推荐其他机会，若其入职其他岗位，您也会获得相应的礼金。点击http://t.cn/R46bU2J马上推荐。"
      # 提交推荐
      when 1 then content = "#{signature} #{company_name}招聘负责人已收到您的推荐，#{recommendee_name}接下来的进展，将实时短信告知，加入荔枝朋友圈，随时看到好机会，打开微信添加运营萌妹子lizzysister为好友即可。"
      # 进入面试
      when 2 then content = "#{signature} 捷报？喜报！反正 #{recommendee_name}获得了#{position_name}的面试机会，眼看着礼金就要到手了，撒花鼓掌，继续搜罗身边优秀的小伙伴，点击http://t.cn/R46bU2J 马上推荐！"
      # 入职
      when 3 then content = "#{signature} 荔枝要告诉你一个严肃的消息，咳咳…#{recommendee_name}已经入职#{company_name}了，一笔7K的奖金即将在10个工作日后转出，成功率99%，快去完善收款信息吧。"
      # 入职金已发放
      when 4 then content = "#{signature} 因你的推荐，#{recommendee_name}已经成功入职#{company_name}，你给予他的是一份认同，给予荔枝的是一份信任，@K代表了我们的绵薄谢意，请笑纳，礼金已转，注意查收。"
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
