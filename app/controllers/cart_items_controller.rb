class CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
    @cart_item.customer_id = current_customer.id
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:id]
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def empty_cart
  end

    private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :quantity)
    end
end
