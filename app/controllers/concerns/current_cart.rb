module CurrentCart
  extend ActiveSupport::Concern

  private

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cat.create
      session[:cart_id] = @cart.id
    end
end
