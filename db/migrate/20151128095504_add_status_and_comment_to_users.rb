class AddStatusAndCommentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
    add_column :users, :comment, :text
  end
end
