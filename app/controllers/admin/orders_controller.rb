class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

	def index
		if params[:customer_id]
		# @customer = Customer.find(params[:id])
		@orders = Order.where(customer_id: params[:customer_id])
		@sum = OrderItem.all.sum(:quantity)
		# @customer = Customer.find(params[:customer_id])
		else
		@orders = Order.all
		@sum = OrderItem.all.sum(:quantity)
		end
	end

	def show
		@order = Order.find(params[:id])
		@orders = Order.all

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
      params.require(:order).permit(:customer_id, :postcode, :address, :address_name, :postage, :total_price, :payment, :order_status, order_items_attributes: [:id, :cooking_status])
    end

end
