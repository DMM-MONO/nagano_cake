# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController
 before_action :reject_inactive_user, only: [:create]
 
  def reject_inactive_user
    customer = Customer.find_by(email: sign_in_params[:email])
    if customer.is_deleted == "退会"
      flash[:notice] = 'このユーザーは退会したユーザーです。'
      redirect_to root_path
    end
  end



  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
