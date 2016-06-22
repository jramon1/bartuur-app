class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def next_product
    # products that:
    # - are not yours
    # - your haven't made any appreciation on it
    # ordered randomly and take the first one
    Product.joins("LEFT OUTER JOIN appreciations ON products.id = appreciations.product_id AND appreciations.user_id = #{current_user.id}").
      where.not(user_id: current_user.id).
      where(appreciations: { id: nil }).
      order("RANDOM()").
      first
  end

  def redirect_to_next_product
    product = next_product

    if product
      redirect_to product_path(next_product)
    else
      redirect_to deckend_products_path
    end
  end
end
