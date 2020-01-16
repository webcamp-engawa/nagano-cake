class HomeController < ApplicationController
  def top
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @genre = @genre.where(is_active: true)
      @items = @genre.items.all
    else
      @genres = Genre.page(params[:page]).reverse_order
      @genre = @genres.where(is_active: true)
      @items = Item.page(params[:page]).reverse_order
      @items = @items.where(is_sold: true)
    end
  end

  def about

  end
end
