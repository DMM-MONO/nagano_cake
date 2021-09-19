class ShippingAddress < ApplicationRecord
  belongs_to :customer

　with_options presence: true do |u|
    u.validates :customer_id
    u.validates :post_code, format: { with: /\A\d{7}\z/}
    u.validates :address
    u.validates :name
  end

end
