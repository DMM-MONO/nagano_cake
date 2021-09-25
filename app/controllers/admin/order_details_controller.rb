class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = Order_detail.find(params[:id])
    @order_detail.update(order_params)
  end
  
   def order_params
    params.require(:order_detail).permit(:making_status)
   end
  
end
