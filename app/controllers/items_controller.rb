class ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id])
      @genres = Genre.all
    else
      @genres = Genre.all
      @items = Item.all
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
