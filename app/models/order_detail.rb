class OrderDetail < ApplicationRecord



    
    enum status: { '制作不可': 0, '制作待ち': 1, '製作中': 2, '制作完了': 3 }

    enum making_status: { '制作不可': 0, '制作待ち': 1, '製作中': 2, '製作完了': 3 }
    
    belongs_to :order
    belongs_to :item
    

end
