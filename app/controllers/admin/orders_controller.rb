class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all
		@order_items = OrderItem.all
		@customer = Customer.find(params[:id])

		@price = 0
			@order_items.each do |order_item|
				@price += (BigDecimal(order_item.order_price) * BigDecimal("1.08")).ceil
			end

		@subtotal = 0
			@order_items.each do |order_item|
				@subtotal += (BigDecimal(order_item.order_price) * order_item.quantity * BigDecimal("1.08")).ceil
			end

		@sum = (OrderItem.all.sum(:order_price)).ceil

	end

	def update
		@order = Order.find(params[:id])
		@orders = Order.all
		@order_items = OrderItem.all
		@order.update(order_params)
		redirect_to admin_orders_path
	end

	private
    def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :address_name, :postage, :total_price, :payment, :order_status, order_items: [:cooking_status])
    end

end
