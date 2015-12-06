class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :phone, presence: true, length: { is: 11 }, uniqueness: true
  
  self.per_page = 5
  
end
