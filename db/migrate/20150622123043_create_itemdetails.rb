class CreateItemdetails < ActiveRecord::Migration
  def change
    create_table :itemdetails do |t|
      t.integer :order_details
      t.integer :number_of_item
      t.integer :item_price
      t.timestamps null: false
    end
  end
end
