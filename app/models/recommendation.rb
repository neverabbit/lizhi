class Recommendation < ActiveRecord::Base
  include RecommendationsHelper
  
  belongs_to :position
  belongs_to :recommender, class_name: "User"
  belongs_to :recommendee, class_name: "User"
  
  validates :recommender_id, presence: true
  validates :recommendee_id, presence: true, uniqueness: { scope: :position, message: "该候选人已经被推荐过，欢迎推荐其他的人选！" }
  validates :comment, presence: { message: "请填写推荐理由或候选人的关键词！" } 
  validates :stage, presence: true, inclusion: { in: lambda { |recommendation|  recommendation.stage_params }}
  validates :status, presence: true, inclusion: { in: lambda { |recommendation|  recommendation.status_params }}
  validates_presence_of :reason, if: lambda { |recommendation| recommendation.status == recommendation.status_params[1] }
  # validates :recommendee_id, 
  
end
