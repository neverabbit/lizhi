module CompaniesHelper
  
  def company_properties
    return ['私营企业', '国有企业', '合资企业']
  end
  
  def company_scale
    return ['少于10人', '10-50人', '50-100人', '100-500人', '500-1000人', '1000-5000人', '5000人以上']
  end
  
  def company_stage
    return ['无需融资', '种子轮', '天使轮', 'A 轮', 'B 轮', 'C 轮', 'D轮', 'E轮', '上市']
  end
end
