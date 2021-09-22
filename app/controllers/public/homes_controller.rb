class Public::HomesController < ApplicationController
  def top
    @customer = current_customer
  end

  def about
  end
end
