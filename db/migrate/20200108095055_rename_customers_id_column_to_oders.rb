class RenameCustomersIdColumnToOders < ActiveRecord::Migration[5.2]
  def change
  	rename_column :Orders, :customers_id, :customer_id
  end
end
