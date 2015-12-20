class AddWeixinToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :weixin_title, :string
    add_column :positions, :weixin_desc, :text
    add_column :companies, :logo_file, :string
  end
end
