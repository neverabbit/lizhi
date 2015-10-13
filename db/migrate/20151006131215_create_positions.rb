class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      
      t.string :name
      t.integer :bonus # unit thousand
      t.integer :salary_top #
      t.integer :salary_bottom
      t.string :city # list
      t.string :district # list
      t.string :address
      t.string :department
      t.string :report_to
      t.string :education # list
      t.string :experience # list
      t.integer :age_top # list
      t.integer :age_bottom
      t.text :keyword # array
      t.integer :recommended
      t.integer :interviewee
      t.integer :entry
      t.integer :remaining
      t.integer :demanding
      t.text :responsibility # array
      t.text :requirement # array
      t.string :status # list
      t.text :comment # array
      t.string :consultant # list
      

      t.timestamps null: false
    end
  end
end
