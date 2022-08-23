class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :status, null: false, default: 0
      t.integer :payment_method, null: false, default: 0
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_price, null: false
      t.integer :price_all, null: false

      t.timestamps
    end
  end
end
