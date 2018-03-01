class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def send_receipt(user, order)
    @user = user
    @order = order
    @url = "http://localhost:3000/orders/#{order.id}"
    mail(to: @user.email, subject: "Order Id: #{order.id}, your receipt:")
  end
end
