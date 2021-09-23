class Admin::OrdersController < ApplicationController
  def show
  @order = Order.find(params[:id])

  end

  def update
     @oder = Order.find(params[:id])
    @oder.update(oder_params)

  end



end
