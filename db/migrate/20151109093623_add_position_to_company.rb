class AddPositionToCompany < ActiveRecord::Migration
  def change
    add_reference :positions, :company, index: true, foreign_key: true
  end
end
