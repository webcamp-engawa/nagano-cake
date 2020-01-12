class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	private
    def order_params
      params.require(:order).permit(:customer_id, :postcode, :address, :address_name, :postage, :total_price, :payment, :order_status, :created_at, :updated_at )
    end

end
