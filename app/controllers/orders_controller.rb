class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @order.customer_id = current_customer.id
    @shippings = Shipping.where(customer_id: current_customer.id)
    @shippings_name= Array.new(@shippings.length)
    for num in 1..@shippings.length do
      @shippings_name[num] = @shippings.find(num).fulladdress.to_s
    end
    @customer = current_customer
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @subtotal = 0
    @cart_item.each do |cart_item|
      @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
    end
    @total = @subtotal + 800

  end

  def create
    case params[:selected_btn]
      when  'self_address'
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.address_name = current_customer.fullname.to_s
        if @order.save
          @cart_items = CartItem.where(customer_id: current_customer.id)
          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @shippings = Shipping.where(customer_id: current_customer.id)
          render :new

        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @order.customer_id = current_customer.id
          render :confirm
        end

      when  "registered_address"
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.postcode = Shipping.find(params[:shipping][:id]).postcode
        @order.address = Shipping.find(params[:shipping][:id]).address
        @order.address_name = Shipping.find(params[:shipping][:id]).address_name
        if @order.save
          @cart_items = CartItem.where(customer_id: current_customer.id)
          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @shippings = Shipping.where(customer_id: current_customer.id)
          @order.postcode = ""
          @order.address = ""
          @order.address_name = ""
          render :new

        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @order.customer_id = current_customer.id
          render :confirm
        end

      when  "new_address"
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if @order.save
          @cart_items = CartItem.where(customer_id: current_customer.id)
          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @shippings = Shipping.where(customer_id: current_customer.id)
          render :new

        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @order.customer_id = current_customer.id
          render :confirm
        end
      else
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if @order.save
          @cart_items = CartItem.where(customer_id: current_customer.id)
          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @shippings = Shipping.where(customer_id: current_customer.id)
          render :new

        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + 800
          @order.customer_id = current_customer.id
          render :confirm
        end
      end
  end

  def confirm
  end

  def done
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :postcode, :address, :address_name,
                           :postage, :total_price, :payment, :order_status, :confirming)
  end
end
