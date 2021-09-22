class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #with_optionsで共通のバリデーションをまとめる

  has_many :shipping_addresses, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :post_code, presence: true, format: { with: /\A\d{7}\z/} #郵便番号は7桁
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/} #電話番号は10桁か11桁
  
  def full_name
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  def full_name
    self.last_name + "" + self.first_name
  end

  def full_name_kana
    self.last_name_kana + "" + self.first_name_kana
  end
  
  def full_address
    "〒" + self.post_code + " " + self.address + " " + self.name
  end

  #退会ステータス
  enum is_deleted: {
    有効: false,
    退会: true,
  }

end
