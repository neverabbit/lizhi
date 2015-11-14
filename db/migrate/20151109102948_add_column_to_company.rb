class AddColumnToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :products, :text
    add_column :companies, :team, :text
    add_column :companies, :stage, :string
  end
end
