class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :cart_items, dependent: :destroy
  #with_optionsで共通のバリデーションをまとめる
  
    validates :first_name, presence:true
    validates :last_name, presence:true
    validates :first_name_kana, presence:true
    validates :last_name_kana, presence:true
    validates :post_code, format: { with: /\A\d{7}\z/}, presence:true #郵便番号は7桁
    validates :address, presence:true
    validates :phone_number, format: { with: /\A\d{10,11}\z/}, presence:true #電話番号は10桁か11桁
  

end
