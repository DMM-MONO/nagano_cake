class Public::OrdersController < ApplicationController
    
    def new
        @order=Order.new
        @shipping_address=ShippingAddress.new
    end
    
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
    end
end
