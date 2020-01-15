class ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @items = Item.where(genre_id: params[:genre_id])
      @items = @items.where(is_sold: true)
      @genres = Genre.page(params[:page]).reverse_order
      @genre = Genre.find(params[:genre_id])
    else
      @genres = Genre.all
      @items = Item.where(is_sold: true)
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
