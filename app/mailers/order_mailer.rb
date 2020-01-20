class OrderMailer < ApplicationMailer
  def creation_email(order, customer)
    @order = order
    @order_items = OrderItem.where(order_id: @order.id)
    @customer = customer
    mail(
      subject: '【ながのCAKE】ご注文完了確認メール',
      to: customer.email
    )
  end
end
