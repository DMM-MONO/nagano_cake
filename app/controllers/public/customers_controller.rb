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
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                     :post_code, :address, :phone_number, :email, :is_deleted)
    end
end

