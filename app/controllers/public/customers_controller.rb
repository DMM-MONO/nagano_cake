class Public::CustomersController < ApplicationController
    
    def unsubscribe
    @customer = current_customer
    end

    def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to about_path
    end
    
    private
    
    def customer_params
      params.require(:customer).permit(:is_deleted)
    end
end
    
