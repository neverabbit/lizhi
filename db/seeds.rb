# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Companies
#
# introduction1 = "科技有限公司是一家基于互联网技术的现代生鲜服务供应商，提供高品质净菜产品和鲜果。我厨是由国内领先的餐饮连锁集团—原微集团和国内知名的投资机构—复星谱润资本和新天域资本联合投资，拥有30000平米国内最大中央厨房的生鲜电商平台，通过3年多供应链体系的建设和夯实，于2015年3月9日在上海发布正式上线。"
# products1 = "网上菜市场，通过手机APP销售1000多种生鲜食材，并且自建冷链物流送菜到家，不仅有海鲜牛排、进口水果等中高端生鲜，还有青菜、猪肉等老百姓餐桌必不可少的普通生鲜，以及免洗、免切、免配的半成品净菜，是一家真正的全品类生鲜电商。"
# team1 = "XXXXXXXXXXX XXXXXXXXXX MMMMMMMM NNNNNNNNN KKKKKKKKKK"
# Company.create!(name: "某知名网上菜市场 O2O 平台",
#                 realname: "我厨（上海）科技有限公司",
#                 address: "上海",
#                 founded_at: "2014",
#                 property: "私营企业",
#                 scale: "100-500人",
#                 stage: "A 轮",
#                 keyword: "网上菜市场 互联网 全品类生鲜",
#                 introduction: introduction1,
#                 products: products1,
#                 team: team1,
#                 worktime: "作五休二")
#
# introduction2 = "中国大陆一个动画、游戏相关的弹幕视频分享网站，网站最大的特点是悬浮于视频上方的实时评论功能。是中国大陆第二家提供这样功能的网站。"
# products2 = "采用会员制，大部分视频会员与游客都可以观看，但部分视频只有会员才可以观看（这些视频常被称为“只有会员才知道的世界”）。以前只有会员才可以发送弹幕表达自己的见解和发布评论，游客也能发送部分弹幕。使用数据库方式储存弹幕，每个人在发送弹幕时IP与会员ID(如果已经登陆了的话)将会被后台记录，由单条弹幕可追查出发送该弹幕的会员ID或IP。"
# team2 = "XXXXXXXXXXX XXXXXXXXXX MMMMMMMM NNNNNNNNN KKKKKKKKKK"
# Company.create!(name: "某知名弹幕视频分享网站",
#                 realname: "上海幻电信息科技有限公司",
#                 address: "上海",
#                 founded_at: "2010",
#                 property: "私营企业",
#                 scale: "100-500人",
#                 stage: "B 轮",
#                 keyword: "视频 弹幕 游戏 动画 分享 新番 日本动画 会员制",
#                 introduction: introduction2,
#                 products: products2,
#                 team: team2,
#                 worktime: "作五休二")
#
#
# responsibility1 = "1、充分理解客户需求，完成客户岗位职责的分析；
# 2、制定完善的人才寻访方案；通过电话、网络或电子邮件等渠道来搜寻候选人;
# 3、负责甄选、评估候选人，向客户提供专业化、标准化以及系统的人才推荐报告；
# 4、协调和推动客户进一步安排候选人的面试并及时反馈面试结果；
# 5、协助双方进行薪资谈判及后续跟踪服务；
# 6、协调客户和被录用者之间良好的关系，关注被录用者的职业发展； "
# requirement1 = "1、大专学历及以上，
# 2、个性成熟、有亲和力，性格开朗、乐观积极；
# 3、良好的团队协作能力，富有高度的责任心与职业操守，优秀的协调能力和出色的沟通、说服、引导能力；
# 4、较强的学习能力、优秀的执行力；优先的自控能力及目标驱动的做事风格；
# 5、能够承受工作压力，具备独立的发现、分析及解决问题的能力；
# 6、有猎头顾问经验、人事招聘工作经验、电话销售经验者优先考虑。"
# company1 = Company.first
# company1.positions.create!(name: "Java 工程师", bonus: 8, salary_top: 50, salary_bottom: 30, city: "上海", district: "浦东新区", address: "松林路111号", department: "技术部", report_to: "技术总监", education: "学历不限", experience: "经验不限", age_top: 0, age_bottom: 0, keyword: "php java", demanding: 1, recommended: 0, interviewee: 0, entry: 0, remaining: 1, responsibility: responsibility1, requirement: requirement1, consultant: "Lisa", status: "上线")
#
#
# responsibility2 = "1、充分理解客户需求，完成客户岗位职责的分析；
# 2、制定完善的人才寻访方案；通过电话、网络或电子邮件等渠道来搜寻候选人;
# 3、负责甄选、评估候选人，向客户提供专业化、标准化以及系统的人才推荐报告；
# 4、协调和推动客户进一步安排候选人的面试并及时反馈面试结果；
# 5、协助双方进行薪资谈判及后续跟踪服务；
# 6、协调客户和被录用者之间良好的关系，关注被录用者的职业发展； "
# requirement2 = "1、大专学历及以上，
# 2、个性成熟、有亲和力，性格开朗、乐观积极；
# 3、良好的团队协作能力，富有高度的责任心与职业操守，优秀的协调能力和出色的沟通、说服、引导能力；
# 4、较强的学习能力、优秀的执行力；优先的自控能力及目标驱动的做事风格；
# 5、能够承受工作压力，具备独立的发现、分析及解决问题的能力；
# 6、有猎头顾问经验、人事招聘工作经验、电话销售经验者优先考虑。"
# company1 = Company.first
# company1.positions.create!(name: "PHP 工程师", bonus: 8, salary_top: 50, salary_bottom: 30, city: "上海", district: "浦东新区", address: "松林路111号", department: "技术部", report_to: "技术总监", education: "学历不限", experience: "经验不限", age_top: 0, age_bottom: 0, keyword: "php java", demanding: 1, recommended: 0, interviewee: 0, entry: 0, remaining: 1, responsibility: responsibility2, requirement: requirement2, consultant: "Arnold", status: "上线")
#
#
# responsibility3 = "1、充分理解客户需求，完成客户岗位职责的分析；
# 2、制定完善的人才寻访方案；通过电话、网络或电子邮件等渠道来搜寻候选人;
# 3、负责甄选、评估候选人，向客户提供专业化、标准化以及系统的人才推荐报告；
# 4、协调和推动客户进一步安排候选人的面试并及时反馈面试结果；
# 5、协助双方进行薪资谈判及后续跟踪服务；
# 6、协调客户和被录用者之间良好的关系，关注被录用者的职业发展； "
# requirement3 = "1、大专学历及以上，
# 2、个性成熟、有亲和力，性格开朗、乐观积极；
# 3、良好的团队协作能力，富有高度的责任心与职业操守，优秀的协调能力和出色的沟通、说服、引导能力；
# 4、较强的学习能力、优秀的执行力；优先的自控能力及目标驱动的做事风格；
# 5、能够承受工作压力，具备独立的发现、分析及解决问题的能力；
# 6、有猎头顾问经验、人事招聘工作经验、电话销售经验者优先考虑。"
# company2 = Company.last
# company2.positions.create!(name: "系统工程师", bonus: 8, salary_top: 50, salary_bottom: 30, city: "上海", district: "浦东新区", address: "松林路111号", department: "技术部", report_to: "技术总监", education: "学历不限", experience: "经验不限", age_top: 0, age_bottom: 0, keyword: "php java", demanding: 1, recommended: 0, interviewee: 0, entry: 0, remaining: 1, responsibility: responsibility3, requirement: requirement3, consultant: "Arnold", status: "上线")





User.create!(name: "Lisa", phone: "18117209130", email: "lisa@leadsto.cn", password: "lisainlz", password_confirmation: "lisainlz", isadmin: true)  
User.create!(name: "Arnold", phone: "18721668737", email: "arnold@leadsto.cn", password: "arnoldinlz", password_confirmation: "arnoldinlz", isadmin: true)    