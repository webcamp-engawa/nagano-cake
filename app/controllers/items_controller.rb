class ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @item = Item.where(genre_id: params[:genre_id])
      @items = @item.where(is_sold: true)
      @search_items = @items.where(is_sold: true)
      @genres = Genre.page(params[:page])
      @genres = @genres.where(is_active: true)
      @genre = Genre.find(params[:genre_id])
    elsif params[:q][:name_cont] == ""
      redirect_to root_path
    else
      @genres = Genre.page(params[:pate])
      @genres = @genres.where(is_active: true)

    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
