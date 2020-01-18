class Admin::OrdersController < ApplicationController

before_action :authenticate_admin!

	def index
		if params[:customer_id]
		@orders = Order.where(customer_id: params[:customer_id]).page(params[:page]).reverse_order
		@sum = OrderItem.all.sum(:quantity)
		elsif params[:button].to_i == 1
		@orders = Order.page(params[:page]).reverse_order
		@sum = OrderItem.all.sum(:quantity)
		else
		@orders = Order.where("created_at >= ?", Time.zone.now.beginning_of_day).page(params[:page]).reverse_order
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
		@order.update(order_params)
		redirect_to admin_orders_path

		#@orders = Order.where('order_status = ?', 2).update.OrderItem.where(:cooking_status => 2)
	end

	private
    def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :address_name, :postage, :total_price, :payment, :order_status, order_items_attributes: [:id, :cooking_status])
    end

end
