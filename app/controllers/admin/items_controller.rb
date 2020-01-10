class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.admin_id = current_admin.admin_id
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sold, :created_at, :updated_at)
    end
end
