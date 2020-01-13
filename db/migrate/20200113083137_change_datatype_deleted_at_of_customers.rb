class ChangeDatatypeDeletedAtOfCustomers < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers,:deleted_at, :boolean, null: false, default: false
  end
end
