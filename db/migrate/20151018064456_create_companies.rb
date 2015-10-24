class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      
      t.string :name
      t.text :introduction
      t.string :property
      t.string :scale
      t.string :address
      t.string :founded_at 
      t.string :keyword
      t.text :comment

      t.timestamps null: false
    end
  end
end
