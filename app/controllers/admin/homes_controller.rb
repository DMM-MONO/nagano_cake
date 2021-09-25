class Admin::HomesController < ApplicationController
  #before_action :authenticate_admin!
  def top
    @customer = current_customer
  end
end
