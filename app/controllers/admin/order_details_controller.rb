class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_params)
    redirect_back(fallback_location: root_path)
  end
  
  private
  def order_params
     params.require(:order_detail).permit(:making_status)
  end
end
