class RenameUserIdColumnToShippings < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shippings, :user_id, :customer_id

  end
end
