class Public::OrdersController < ApplicationController

    before_action :authenticate_customer!
  
    def complete
    end

    def new
        @order=Order.new
        @shipping_address=ShippingAddress.new

    end

    def confirm

      @cart_items=CartItem.where(customer_id:current_customer.id)
      @order=Order.new(order_params)
      @address_number=order_params[:address_number]
      @shipping_address_id=order_params[:shipping_address_id]
      if @address_number == "0"
        @order.address = current_customer.address
        @order.post_code = current_customer.post_code
        @order.name = current_customer.full_name
      elsif @address_number == "1"
        @shipping_address=ShippingAddress.find(@shipping_address_id)
        @order.address = @shipping_address.post_code
        @order.post_code = @shipping_address.address
        @order.name = @shipping_address.name
      else
        @shipping_address=ShippingAddress.new
        @shipping_address.post_code = order_params[:post_code]
        @shipping_address.address = order_params[:address]
        @shipping_address.name = order_params[:name]
      end
    end
    

    def create
      @address_number=order_params[:address_number]
      @order = Order.new(order_params)
      @shipping_address_id = order_params[:shipping_address_id]
      if @address_number == "2"
        @order.save
        #配送先新規登録
        @shipping_address = ShippingAddress.new
        @shipping_address.customer_id = current_customer.id
        @shipping_address.post_code = order_params[:post_code]
        @shipping_address.address = order_params[:address]
        @shipping_address.name = order_params[:name]
        @shipping_address.save
      else
        @order.save
      end
      redirect_to complete_orders_path
    end
  
    private

    def order_params
    params.require(:order).permit(:name, :payment_method,:address_number,:shipping_address_id, :shipping_address, :post_code, :address, :total_payment).merge(customer_id: current_customer.id ,postage: 800)
    end

end

