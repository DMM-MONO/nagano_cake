class Admin::OrdersController < ApplicationController
  def show
  @order = Oder.find(params[:id])
    
  end
  
  def update
     @oder = Order.find(params[:id])
    @oder.update(oder_params)
    
  end
  
    def order_params
    params.require(:order).permit(:post_code, :address, :name, :postage, :otal_payment, :payment_method, :status,:created_at,:cutomer_id)
    end
  
end
