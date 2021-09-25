class Public::CustomersController < ApplicationController
    def edit
      @customer = current_customer
    end

    def show
      @customer = current_customer
    end

    def update
      @customer = current_customer
      if @customer.update(customer_params)
      flash[:notice]="会員情報を更新しました"

      

      redirect_to  my_page_customer_path

      else
      render "edit"
      end
    end

    def unsubscribe
      @customer = current_customer
    end

    def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
    end

    private
    def customer_params
      params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :email)
    end

end

