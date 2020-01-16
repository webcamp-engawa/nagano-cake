class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

	def index
		if params[:customer_id]
		# @customer = Customer.find(params[:id])
		@orders = Order.where(customer_id: params[:customer_id])
		@sum = OrderItem.all.sum(:quantity)
		# @customer = Customer.find(params[:customer_id])
		# elsif params[:created_at]
		# # @time = Time.zone.now.beginning_of_day
		# @orders = Order.where(created_at: params[:created_at])
		# # @orders = Order.all
		# @sum = OrderItem.all.sum(:quantity)
	else
		@orders = Order.all
		end

		@orders = Order.page(params[:page]).reverse_order
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all
		@order_item = OrderItem.find(params[:id])
		@unit_price = (BigDecimal(@order_item.order_price) * BigDecimal("1.08")).ceil

		

	end

	def update
		@order = Order.find(params[:id])
		@orders = Order.all
		@order.update(order_params)
		redirect_to admin_orders_path

		#@orders = Order.where('order_status = ?', 2).update.OrderItem.where(:cooking_status => 2)
	end

	private
    def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :address_name, :postage, :total_price, :payment, :order_status, order_items_attributes: [:id, :cooking_status])
    end

end
