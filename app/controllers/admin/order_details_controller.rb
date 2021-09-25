class Admin::OrderDetailsController < ApplicationController
  def update

    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_params)
    
    if params[:order_detail][:making_status] == "製作中"
      @order.update(status: 2)
    end
    
      @order_details = @order.order_details
      @sum = 0
      @order_details.each do |order_detail|
        if order_detail.making_status == "製作完了"
          @sum += 1
        end
      end
    
    if  @order_details.count == @sum
      @order.update(status: 3)
    end
    
    redirect_to admin_order_path(@order)
    
  end

  private
  def order_params
     params.require(:order_detail).permit(:making_status)

  end
end
