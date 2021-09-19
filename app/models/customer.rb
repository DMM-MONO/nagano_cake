class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_addresses, dependent: :destroy

  #with_optionsで共通のバリデーションをまとめる
  with_options presence: true do |u|
    u.validates :first_name
    u.validates :last_name
    u.validates :first_name_kana
    u.validates :last_name_kana
    u.validates :post_code, format: { with: /\A\d{7}\z/} #郵便番号は7桁
    u.validates :address
    u.validates :phone_number, format: { with: /\A\d{10,11}\z/} #電話番号は10桁か11桁
  end

end
