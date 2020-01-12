class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @shippings = Shipping.where(customer_id: current_customer.id)
    @customer = current_customer
  end

  def create
  end

  def confirm
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @order = Order.new
  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :address_name,
                           :postage, :total_price, :payment, :order_status)
  end
end
