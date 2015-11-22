class AddIndexToUser < ActiveRecord::Migration
  def change
    add_index :users, :phone
    add_index :users, :email
    add_index :users, :name
    add_index :users, :city
    add_index :users, :isadmin
  end
end
