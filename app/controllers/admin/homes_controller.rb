class Admin::HomesController < ApplicationController
  
  def top
    @customer = current_customer

    @orders = Order.page(params[:page])

   
  

  end



end
