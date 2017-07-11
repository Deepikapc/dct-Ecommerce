class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :product_id
    	t.string :title
    	t.text :body
    	t.integer :user_id
    	t.integer :rating

      t.timestamps null: false
    end
  end
end
