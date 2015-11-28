class Recommendation < ActiveRecord::Base
  belongs_to :position
  belongs_to :recommender, class_name: "User"
  belongs_to :recommendee, class_name: "User"
  
  validates :recommender_id, presence: true
  validates :recommendee_id, presence: true
  
end
