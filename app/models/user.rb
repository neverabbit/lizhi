class User < ActiveRecord::Base
  
  before_save { self.email = email.downcase unless email.nil? }
  validates :phone, presence: true, length: { is: 11 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, allow_blank: true, 
                          format: { with: VALID_EMAIL_REGEX }
                          
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
end
