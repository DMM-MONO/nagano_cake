class Admin::HomesController < ApplicationController
  #before_action :authenticate_admin!
  
  def top
    @customer = current_customer

    @orders = Order.page(params[:page])

   
  

  end



end
