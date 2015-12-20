class Company < ActiveRecord::Base
  include CompaniesHelper
  
  mount_uploader :logo_file, LogoUploader
  
  has_many :positions
  
  validates :name, :realname, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :address, length: { maximum: 50 }, allow_blank: true
  validates :property, presence: true, inclusion: { in: lambda { |company|  company.company_properties }}
  validates :scale, presence: true, inclusion: { in: lambda {|company| company.company_scale} }
  validates :stage, presence: true, inclusion: { in: lambda {|company| company.company_stage} }
  validates :logo_file, presence: true

end
