# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Companies

introduction1 = "科技有限公司是一家基于互联网技术的现代生鲜服务供应商，提供高品质净菜产品和鲜果。我厨是由国内领先的餐饮连锁集团—原微集团和国内知名的投资机构—复星谱润资本和新天域资本联合投资，拥有30000平米国内最大中央厨房的生鲜电商平台，通过3年多供应链体系的建设和夯实，于2015年3月9日在上海发布正式上线。"
products1 = "网上菜市场，通过手机APP销售1000多种生鲜食材，并且自建冷链物流送菜到家，不仅有海鲜牛排、进口水果等中高端生鲜，还有青菜、猪肉等老百姓餐桌必不可少的普通生鲜，以及免洗、免切、免配的半成品净菜，是一家真正的全品类生鲜电商。"
team1 = "XXXXXXXXXXX XXXXXXXXXX MMMMMMMM NNNNNNNNN KKKKKKKKKK"
Company.create!(name: "某知名网上菜市场 O2O 平台", 
                address: "上海市浦东新区", 
                founded_at: "2014", 
                property: "私营企业", 
                scale: "100-500人", 
                stage: "A 轮", 
                keyword: "网上菜市场 互联网 全品类生鲜", 
                introduction: introduction1, 
                products: products1, 
                team: team1)
                
introduction2 = "中国大陆一个动画、游戏相关的弹幕视频分享网站，网站最大的特点是悬浮于视频上方的实时评论功能。是中国大陆第二家提供这样功能的网站。"
products2 = "采用会员制，大部分视频会员与游客都可以观看，但部分视频只有会员才可以观看（这些视频常被称为“只有会员才知道的世界”）。以前只有会员才可以发送弹幕表达自己的见解和发布评论，游客也能发送部分弹幕。使用数据库方式储存弹幕，每个人在发送弹幕时IP与会员ID(如果已经登陆了的话)将会被后台记录，由单条弹幕可追查出发送该弹幕的会员ID或IP。"
team2 = "XXXXXXXXXXX XXXXXXXXXX MMMMMMMM NNNNNNNNN KKKKKKKKKK"
Company.create!(name: "某知名动画、游戏相关的弹幕视频分享网站", 
                address: "上海市", 
                founded_at: "2010", 
                property: "私营企业", 
                scale: "100-500人", 
                stage: "B 轮", 
                keyword: "视频 弹幕 游戏 动画 分享 新番 日本动画 会员制", 
                introduction: introduction2, 
                products: products2, 
                team: team2)