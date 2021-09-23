class RenameCutomerIdColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :cutomer_id, :customer_id
  end
end
