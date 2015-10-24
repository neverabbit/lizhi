class Company < ActiveRecord::Base
  include CompaniesHelper
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :address, length: { maximum: 50 }, allow_blank: true
  validates :property, presence: true, inclusion: { in: lambda { |company|  company.company_properties }}
  validates :scale, presence: true, inclusion: { in: lambda {|company| company.company_scale} }
  
  # company_properties
  # def company_properties
#     return ['国有', '私营', '合资']
#   end

end
