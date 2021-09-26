class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.string :post_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_method
      t.integer :status, default: "入金待ち"

      t.timestamps
    end
  end
end
