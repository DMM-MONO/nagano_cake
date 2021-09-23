class Admin::HomesController < ApplicationController
  
  def top
    @customer = current_customer
    @orders = Oder.page(params[:page])
  
  end



end
