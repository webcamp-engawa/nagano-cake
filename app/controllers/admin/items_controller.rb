class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.admin_id = current_admin.admin_id
    @item.save
    redirect_to item_path
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sold, :created_at, :updated_at)
    end
end
