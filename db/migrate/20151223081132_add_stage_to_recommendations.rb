class AddStageToRecommendations < ActiveRecord::Migration
  def change
    add_column :recommendations, :stage, :string
    add_column :recommendations, :reason, :string
    add_column :recommendations, :history, :text
  end
end
