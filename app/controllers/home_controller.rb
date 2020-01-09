class HomeController < ApplicationController
  def top
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.all
    else
      @genres = Genre.all
      @items = Item.all
    end
  end

  def about

  end
end
