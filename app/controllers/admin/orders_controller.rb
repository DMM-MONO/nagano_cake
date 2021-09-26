class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
      @order = Order.find(params[:id])
  end

  def update
     @order = Order.find(params[:id])
     @order_detail = @order.order_details
     @order.update(order_params)
     
     if params[:order][:status] == "入金確認"
       @order_detail.update(making_status: 1)
     end
     redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
     params.require(:order).permit(:status)
  end


end
