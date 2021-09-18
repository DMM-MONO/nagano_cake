class Item < ApplicationRecord

  attachment :image

    
   belongs_to :genre
   # 販売ステータス０販売中 １販売停止
   enum is_active: {
    sold: true,
    soldout: false,
   }
   
   
   # 注文ステータス（0=支払待ち / 1=支払済み / 2=発送準備中 / 3=発送済み）
   enum order_status: {
    waiting: 0,
    paid_up: 1,
    preparing: 2,
    shipped: 3
}
    

end
