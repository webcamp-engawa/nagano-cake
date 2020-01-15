class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.order
  end

  def new
    @order = Order.new

     @order.customer_id = current_customer.id
    @shippings = Shipping.where(customer_id: current_customer.id)
    @shippings_name= Array.new(@shippings.length)

    @customer = current_customer
    @cart_item = CartItem.where(customer_id: current_customer.id)
    @subtotal = 0
    @cart_item.each do |cart_item|
      @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
    end
    @total = @subtotal + @order.postage
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
          @total = @subtotal + @order.postage
          @shippings = Shipping.where(customer_id: current_customer.id)
          render :new
        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + @order.postage
          @order.customer_id = current_customer.id
          render :confirm
        end
      when  "registered_address"
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        @order.postcode = Shipping.find(params[:order][:shipping]).postcode
        @order.address = Shipping.find(params[:order][:shipping]).address
        @order.address_name = Shipping.find(params[:order][:shipping]).address_name
        if @order.save

        @cart_items = CartItem.where(customer_id: current_customer.id)
        @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.quantity = cart_item.quantity
        @order_item.order_price = cart_item.item.price
        @order_item.cooking_status = 1
        @order_item.save
        end



          @cart_items = CartItem.where(customer_id: current_customer.id)
          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + @order.postage
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
          @total = @subtotal + @order.postage
          @order.customer_id = current_customer.id
          @btn = params[:selected_btn]
          render :confirm
        end

      when  "new_address"

        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if @order.save
          @cart_items = CartItem.where(customer_id: current_customer.id)

        @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.quantity = cart_item.quantity
        @order_item.order_price = cart_item.item.price
        @order_item.cooking_status = 1
        @order_item.save
        end



          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + @order.postage
          @shippings = Shipping.where(customer_id: current_customer.id)
          render :new
        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + @order.postage
          @order.customer_id = current_customer.id
          @btn = params[:selected_btn]
          render :confirm
        end

      else
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id
        if @order.save
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = @order.id
        @order_item.item_id = cart_item.item_id
        @order_item.quantity = cart_item.quantity
        @order_item.order_price = cart_item.item.price
        @order_item.cooking_status = 1
        @order_item.save
        end
          @cart_items = CartItem.where(customer_id: current_customer.id)
          @cart_items.destroy_all
          redirect_to orders_done_path
        elsif @order.errors.any?
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + @order.postage
          @shippings = Shipping.where(customer_id: current_customer.id)
          render :new
        else
          @cart_item = CartItem.where(customer_id: current_customer.id)
          @subtotal = 0
          @cart_item.each do |cart_item|
            @subtotal += BigDecimal(cart_item.item.price) * cart_item.quantity * BigDecimal("1.08")
          end
          @total = @subtotal + @order.postage
          @order.customer_id = current_customer.id
          @btn = params[:selected_btn]
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
                           :postage, :total_price, :payment, :order_status, :confirming, :shipping)
  end


end
