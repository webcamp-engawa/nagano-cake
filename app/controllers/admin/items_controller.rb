class Admin::ItemsController < ApplicationController

before_action :authenticate_admin!

  def index
    @q = Item.ransack(params[:q])
    @items = Item.page(params[:page]).per(9)
    if params[:q]
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct:true).page(params[:page]).per(9)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
    redirect_to admin_item_path(@item)
    flash[:notice_update] = "商品が更新されました!"
    else
      render :edit
    end
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to admin_items_path
      flash[:notice_new] = "商品が登録されました!"
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:genre_id, :name, :introduction, :image, :price, :is_sold, :created_at, :updated_at)
    end
end
