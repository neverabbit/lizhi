class AddWorktimeToPositions < ActiveRecord::Migration
  def change
    add_column :companies, :worktime, :string
  end
end
