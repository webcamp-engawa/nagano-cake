class RemoveDeletedAtFromCustomers < ActiveRecord::Migration[5.2]
  def up
    remove_column :customers, :deleted_at
  end

  def down
  	add_column :customers, :deleted_at, :boolean
  end
end
