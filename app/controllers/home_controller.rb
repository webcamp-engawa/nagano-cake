class HomeController < ApplicationController
  def top
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @genres = @genre.where(is_active: true)
      @items = @genres.items.all
    elsif params[:q]
      @genre = Genre.where(is_active: true)
      @items = @genre.item.where(is_sold: true)

    else
      @genres = Genre.where(is_active: true)
      # @genres = @genre.where(is_active: true)
      @items = Item.active_all.page(params[:page]).reverse_order.per(9)
      
    end
  end

  def about

  end
end
