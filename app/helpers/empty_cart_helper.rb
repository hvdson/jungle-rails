module EmptyCartHelper
  def empty_cart(cart)
    if cart.empty?
      render :partial => 'empty'
    else
      render :partial => 'not_empty'
    end
  end
end