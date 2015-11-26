class AddRealnameToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :realname, :string
  end
end
