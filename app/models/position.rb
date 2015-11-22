class Position < ActiveRecord::Base
  # serialize :keywords
  # serialize :responsibilities
  # serialize :requirements
  # serialize :comments
  
  belongs_to :company
  
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :company }
  validates :bonus, presence: true #, FILL
  validates :salary_top, :salary_bottom, presence: true #, #FILL
  validates :salary_top, numericality: { greater_than_or_equal_to: lambda{ |position| position.salary_bottom } }
  validates :city, presence: true #, FILL
  validates :district, presence: true #, FILL
  validates :address, presence: true, length: { maximum: 50 }
  validates :department, presence: true, length: { maximum: 50 }
  validates :report_to, length: { maximum: 50 }
  validates :education, presence: true #, FILL
  validates :experience, presence: true #, FILL
  validates :age_top, :age_bottom, presence: true #, FILL
  validates :recommended, :interviewee, :entry, :remaining, :demanding, :responsibility, :requirement, presence: true
  validates :status, presence: true #, FILL
  validates :consultant, presence: true #, FILL
  
  
  
  
  
  
end
