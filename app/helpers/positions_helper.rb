module PositionsHelper
  
  def consultant_list
    list = []
    User.where(isadmin: true).each do |a|
      list << a.name
    end
    
    return list
  end
end
