class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @subtotal = 0
    @cart_items.each do |cart_item|
      @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
    end

  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      session[:cart_item] = @cart_item.attributes.slice(*cart_item_params.keys)
      @genres = Genre.all
      @item = Item.find_by(id:@cart_item.item_id)
      redirect_to item_path(@item.id), flash: {alert: '※個数を選択して下さい'}
    end
  end

  def update
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_item.find(params[:id]).update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @cart_item.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def empty_cart
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

    private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
    end
end
