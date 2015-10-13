class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :position
      t.string :company
      t.text :comment
      

      t.timestamps null: false
    end
  end
end
