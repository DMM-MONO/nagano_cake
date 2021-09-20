class Order < ApplicationRecord
    
  enum status: { '入金待ち': 0, '入金確認': 1, '製作中': 2, '発送準備中': 3, '発送済み':4 }
  enum payment_method: { 'クレジット': 0, '銀行振込': 1 }
  
  belongs_to :customer
  
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :total_payment, presence: true
  validates :postage, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true

end
