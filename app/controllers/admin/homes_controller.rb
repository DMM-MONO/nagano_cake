class Admin::HomesController < ApplicationController
  def top
    @customer = current_customer
  end
end
