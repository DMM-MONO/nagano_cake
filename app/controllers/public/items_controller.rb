class Public::ItemsController < ApplicationController

    def index
        @item = Item.all
        @items = Item.search(params[:genre_id]).page(params[:page]).per(10)
        @items = Item.where(is_active: true)
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
