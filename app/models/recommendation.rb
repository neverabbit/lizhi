class Recommendation < ActiveRecord::Base
  belongs_to :position
  belongs_to :recommender, class_name: "User"
  belongs_to :recommendee, class_name: "User"
  
  validates :recommender_id, presence: true
  validates :recommendee_id, presence: true, uniqueness: { scope: :position, message: "该候选人已经被推荐过，欢迎推荐其他的人选！" }
  # validates :recommendee_id, 
  
end
