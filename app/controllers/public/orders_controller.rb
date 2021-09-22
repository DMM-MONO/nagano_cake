class Public::OrdersController < ApplicationController
    
    def new
        @order=Order.new
        @shipping_address=ShippingAddress.new
    end
    
    def confirm
        @cart_items=CartItem.where(customer_id:current_customer.id)
        @order=Order.new(order_params)
        @address=order_params[:address]
        @shipping_address_id=order_params[:shipping_address_id]
        if @shipping_sel == "0"
          @shipping_address=ShippingAddress.new
        elsif @shipping_sel == "1"
          @shipping_address=ShippingAddress.find(@shipping_address_id)
        else
          @shipping_address=ShippingAddress.new(shipping_address_params[:shipping_address])

        end
         
    end 
    
    private
    
    def order_params
    params.require(:order).permit(:payment_method,:shipping_sel,:shipping_address_id).merge(customer_id: current_customer.id ,postage: 800)
    end

    def shipping_address_params
    params.require(:order).permit(shipping_address:[:postcode, :address, :address_name])
    end

end

