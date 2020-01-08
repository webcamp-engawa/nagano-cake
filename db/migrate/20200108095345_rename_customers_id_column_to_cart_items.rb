class RenameCustomersIdColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :Cart_items, :customers_id, :customer_id
  end
end
