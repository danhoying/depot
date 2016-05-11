class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @counter = access_count
  end

  private

    def access_count
      if session[:counter].nil?
        session[:counter] = 0
      end
      session[:counter] += 1
    end
end
