class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text   :description 
      t.float  :price
      t.integer :category_id
      t.integer :stock
      t.boolean :cod_eligibility,default: true
      t.string :image_url
      #arguments for methods we use colon before,option for the method we use colon after
      t.timestamps null: false
    end
  end
end
