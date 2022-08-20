class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null: false, default: 

      t.timestamps
    end
  end
end
