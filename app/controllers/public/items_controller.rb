class Public::ItemsController < ApplicationController

    def index
        @items = Item.search(params[:genre_id])
        @items = Item.where(is_active: true)
        @item = Item.page(params[:page])
        @genres = Genre.all
        if params[:genre_id]
            @genre = Genre.find(params[:genre_id])
        end
    end

    def show
        @cart_item = CartItem.new
        @item = Item.find(params[:id])
        @genres = Genre.all
        if params[:genre_id]
            @genre = Genre.find(params[:genre_id])
        end
    end
end
