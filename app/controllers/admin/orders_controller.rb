class Admin::OrdersController < ApplicationController
  def show
<<<<<<< HEAD
  @order = Order.find(params[:id])
@order_details = @order.order_details
  end

  def update
     @oder = Order.find(params[:id])
    @oder.update(oder_params)

  end



=======
  @order = Oder.find(params[:id])
    
  end
  
  def update
     @oder = Order.find(params[:id])
    @oder.update(oder_params)
    
  end
  
    def order_params
    params.require(:order).permit(:post_code, :address, :name, :postage, :otal_payment, :payment_method, :status,:created_at,:cutomer_id)
    end
  
>>>>>>> origin/cake
end
