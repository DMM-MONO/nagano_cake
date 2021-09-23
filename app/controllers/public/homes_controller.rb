class Public::HomesController < ApplicationController
  def top
    @customer = current_customer
    @items = Item.where(is_active: true)
    @items = Item.limit(4).order(created_at: :desc)
    @genres = Genre.all
  end

  def about
  end
end
