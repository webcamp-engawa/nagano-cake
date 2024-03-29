class Admin::CustomersController < ApplicationController


before_action :authenticate_admin!

	def index
		@search_c = Customer.ransack(params[:q])
  		@customers = @search_c.result.page(params[:page])
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
			if @customer.update(customer_params)
			redirect_to admin_customer_path(@customer.id)
			flash[:notice_edit] = "会員情報が更新されました!"
		else
			render 'edit'
		end
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:email,:is_deleted)
	end

end
