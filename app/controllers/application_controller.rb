
class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #deviseのストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,
                                                       :post_code, :address, :phone_number])
  end

  def after_sign_up_path_for(resource)
    about_path # サインアップ後に遷移するpathを設定
  end

  def after_sign_in_path_for(resource)
    about_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    about_path # ログアウト後に遷移するpathを設定
  end


end
