class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @shippings = Shipping.where(customer_id: current_customer.id)
    console
  end

  def create
  end

  def confirm
  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :address_name,
                           :postage, :total_price, :payment, :order_status)
  end
end
