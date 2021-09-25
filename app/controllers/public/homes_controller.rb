class Public::HomesController < ApplicationController
  def top
    @customer = current_customer
    @items = Item.search(params[:genre_id])
    @items = Item.where(is_active: true)
    @items = Item.limit(4).order(created_at: :desc)
    @genres = Genre.all
    @genres = Genre.all
    if params[:genre_id]
        @genre = Genre.find(params[:genre_id])
    end
  end

  def about
  end
end
