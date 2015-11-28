class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :recommender_id
      t.integer :recommendee_id
      t.references :position, index: true

      t.timestamps null: false
    end
    add_index :recommendations, :recommender_id
    add_index :recommendations, :recommendee_id
    add_index :recommendations, [:position_id, :recommender_id, :recommendee_id], unique: true, name: 'my_index'
    add_index :recommendations, [:position_id, :created_at]
  end
end
