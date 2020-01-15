class CustomersController < ApplicationController

before_action :authenticate_customer!

  def leave
  end

  def show
  	@customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
    @customer = current_customer
    if params[:unko] == "1"
      current_customer.update(is_deleted: true)
      redirect_to new_customer_session_path,notice_leave:"退会処理が完了しました"
    else
      if @customer.update(customer_params)
        redirect_to customer_path
        flash[:notice_update] = "会員情報が更新されました!"
      else
        render 'edit'
      end
    end
  end

  #def destroy
    #current_customer.is_deleted = true save
    #redirect_to root_path
  #end


  private
	def customer_params
		params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:address,:phone_number,:email)
	end
end
