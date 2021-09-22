class Public::OrdersController < ApplicationController
    
    def new
        @order=Order.new
        @shipping_address=ShippingAddress.new
    end
end
