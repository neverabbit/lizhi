module PositionsHelper
  
  def consultant_list
    list = []
    User.where(isadmin: true).each do |a|
      list << a.name
    end
    return list
  end
  
  def education_list
    ['学历不限', '初中及以上', '高中及以上', '大专及以上', '本科及以上', '硕士及以上', '博士及以上']
  end
  
  def experience_list
    ['经验不限', '1年以上', '3年以上', '5年以上', '8年以上', '15年以上']
  end
end
