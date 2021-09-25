class Order < ApplicationRecord
    
  enum status: { '入金待ち': 0, '入金確認': 1, '製作中': 2, '発送準備中': 3, '発送済み':4 }
  enum payment_method: { 'クレジット': 0, '銀行振込': 1 }
  enum address_number: {'ご自身の住所': 0, '登録済住所住所から選択': 1, '新しいお届け先': 2 }
  
  belongs_to :customer
  attr_accessor :shipping_address_id, :address_number
  
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :customer_id, presence: true
  

end
