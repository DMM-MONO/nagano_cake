class Item < ApplicationRecord

  attachment :image

   has_many :cart_items, dependent: :destroy
   has_many :order_details, dependent: :destroy
   
   belongs_to :genre
   # 販売ステータス０販売中 １販売停止
   enum is_active: {
    販売中: true,
    販売停止中: false,
   }


   # 注文ステータス（0=支払待ち / 1=支払済み / 2=発送準備中 / 3=発送済み）
   enum order_status: {
    waiting: 0,
    paid_up: 1,
    preparing: 2,
    shipped: 3
}


    # 消費税を加えた商品価格
 def add_tax_price
        (self.price * 1.1).round
 end


    def self.search(search)
      if search
        Item.where("genre_id = #{search}")
      else
        Item.all
      end

    end


end
