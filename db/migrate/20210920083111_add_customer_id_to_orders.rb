class AddCustomerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cutomer_id, :integer
  end
end
