class RenameUserIdColumnToShippings < ActiveRecord::Migration[5.2]
  def change
  	rename_column :Shippings, :user_id, :customer_id
  	
  end
end
