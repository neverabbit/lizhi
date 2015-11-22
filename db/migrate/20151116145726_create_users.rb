class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.string :name
      t.string :email
      t.string :city
      t.text :quality 
      t.string :position
      t.string :start_year
      t.string :birthday
      # t.text :experience
      # t.text :project
      # t.text :education
      t.string :gender
      t.string :marriage
      t.string :hometown
      t.integer :salary
      
      t.string :password_digest
      

      t.timestamps null: false
    end
  end
end
