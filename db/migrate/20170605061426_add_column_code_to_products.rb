class AddColumnCodeToProducts < ActiveRecord::Migration
  def change
  	add_column :products,:code,:string
  end
end
