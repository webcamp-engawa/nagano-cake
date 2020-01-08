class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customers_id
      t.string :postcode
      t.string :address
      t.string :address_name
      t.integer :postage
      t.integer :total_price
      t.integer :payment
      t.integer :order_status

      t.timestamps
    end
  end
end
