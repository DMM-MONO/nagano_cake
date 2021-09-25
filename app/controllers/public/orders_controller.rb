class Public::OrdersController < ApplicationController

    before_action :authenticate_customer!

    def complete
    end

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

      @order = Order.new(order_params)
      @address_number=order_params[:address_number]
      @address_number == "0"
      @order.post_code = Customer.find(current_customer.id).post_code
      @order.address = Customer.find(current_customer.id).address
      @order.name = Customer.find(current_customer.id).full_name
      @order.save!
      current_customer.cart_items.each do |cart_item|
          @order_details = @order.order_details.new
          @order_details.order_id = @order.id
          @order_details.item_id = cart_item.item_id
          @order_details.price = cart_item.item.price
          @order_details.amount = cart_item.amount

          @order_details.save
          cart_item.destroy
        end

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

      current_customer.cart_items.each do |cart_item|
          @order_details = @order.order_details.new
          @order_details.order_id = @order.id
          @order_details.item_id = cart_item.item_id
          @order_details.price = cart_item.item.price
          @order_details.amount = cart_item.amount
          @order_details.save
          cart_item.destroy
        end
      redirect_to complete_orders_path
    end


   def order_params
    params.require(:order).permit(:name, :payment_method,:address_number,:shipping_address_id, :shipping_address, :post_code, :address, :total_payment).merge(customer_id: current_customer.id ,postage: 800)
   end

end
