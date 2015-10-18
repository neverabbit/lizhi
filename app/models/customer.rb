class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true
  
  self.per_page = 5
  
end
