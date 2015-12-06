class AddCommentToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :status, :string
    add_column :recommendations, :comment, :text
  end
end
