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
    
    def confirm
        @cart_items=CartItem.where(customer_id:current_customer.id)
        @order=Order.new(order_params)
        @address_number=order_params[:address_number]
        @shipping_address_id=order_params[:shipping_address_id]
        if @address_number == "0"
          @shipping_address=ShippingAddress.new
        elsif @address_number == "1"
          @shipping_address=ShippingAddress.find(@shipping_address_id)
          @order.address = @shipping_address.post_code
          @order.post_code = @shipping_address.address
          @order.name = @shipping_address.name
          @order.address = @shipping_address.post_code
          @order.post_code = @shipping_address.address
          @order.name = @shipping_address.name
        else
          @shipping_address=ShippingAddress.new(shipping_address_params[:shipping_address])

        end
         
    end 
    
    def create

      @order = Order.new(order_params)
      @address_number=order_params[:address_number]
      @address_number == "0"
      @order.post_code = Customer.find(current_customer.id).post_code
      @order.address = Customer.find(current_customer.id).address
      @order.name = Customer.find(current_customer.id).full_name
      #if文
      #@shipping_address=ShippingAddress.find(@shipping_address_id)
      #@order.post_code = @shipping_address.post_code
      #@order.address = @shipping_address.address
      #@order.name = @shipping_address.name
      #ここまで
      @order.save!
      current_customer.cart_items.each do |cart_item|
          @order_details = @order.order_details.new
          @order_details.order_id = @order.id
          @order_details.item_id = cart_item.item_id
          @order_details.price = cart_item.item.price
          @order_details.amount = cart_item.amount
          # @order_details.status = 1
          @order_details.save
          cart_item.destroy
        end
      
      @shipping_address_id = order_params[:shipping_address_id]
      if @address_number == "2"
        @order.save
        @shipping_address = ShippingAddress.new
        @shipping_address.customer_id = current_customer.id
        @shipping_address.post_code = order_params[:post_code]
        @shipping_address.address = order_params[:address]
        @shipping_address.name = order_params[:name]
        @shipping_address.save
      else
        @order.save
      end

        redirect_to my_page_customer_path


      
    end
      
      #elsif @address_number == "1"
        #@shipping_address=ShippingAddress.find(@shipping_address_id)
        #@order.address = @shipping_address.post_code
        #@order.post_code = @shipping_address.address
        #@order.name = @shipping_address.name
        #@order.save
     # else
       # @order.post_code = order_params[:post_code]
        #@order.address = order_params[:address]
        #@order.name = order_params[:name]
        #@order.save
        #配送先住所登録
       # @shipping_address = ShippingAddress.new
       # @shipping_address.customer_id = current_customer.id
        #@shipping_address.post_code = order_params[:post_code]
        #@shipping_address.address = order_params[:address]
        #@shipping_address.name = order_params[:name]
        #@shipping_address.save
      #end
      #redirect_to my_page_customer_path
    #end
      
      #elsif @address_number == "1"
        #@shipping_address=ShippingAddress.find(@shipping_address_id)
        #@order.address = @shipping_address.post_code
        #@order.post_code = @shipping_address.address
        #@order.name = @shipping_address.name
        #@order.save
     # else
       # @order.post_code = order_params[:post_code]
        #@order.address = order_params[:address]
        #@order.name = order_params[:name]
        #@order.save
        #配送先住所登録
       # @shipping_address = ShippingAddress.new
       # @shipping_address.customer_id = current_customer.id
        #@shipping_address.post_code = order_params[:post_code]
        #@shipping_address.address = order_params[:address]
        #@shipping_address.name = order_params[:name]
        #@shipping_address.save
      #end
      #redirect_to my_page_customer_path
    #end
    
    
    private
    
    def order_params
    params.require(:order).permit(:payment_method,:address_number,:shipping_address_id, :shipping_address, :post_code, :address).merge(customer_id: current_customer.id ,postage: 800)
    end

    def shipping_address_params
    params.require(:order).permit(shipping_address:[:post_code, :address, :name, :shipping_address])
    end

end
