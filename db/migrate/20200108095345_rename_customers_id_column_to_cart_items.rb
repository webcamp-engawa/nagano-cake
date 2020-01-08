class RenameCustomersIdColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :cart_items, :customers_id, :customer_id
  end
end
