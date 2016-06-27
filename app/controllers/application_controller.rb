class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def next_product
    if current_user.distance_radius.present?
      @nearby_user_ids = User.near(current_user.full_address, current_user.distance_radius, units: :km).map(&:id)
    end

    # products that:
    # - are not yours
    # - your haven't made any appreciation on it
    # - are in your area (based on distance)
    # ordered randomly and take the first one
    @products = Product.joins("LEFT OUTER JOIN appreciations ON products.id = appreciations.product_id AND appreciations.user_id = #{current_user.id}").
      where.not(user_id: current_user.id).
      where(appreciations: { id: nil })

    if @nearby_user_ids
      @products = @products.where(user_id: @nearby_user_ids)
    end

    @products.order("RANDOM()").first
  end

  def redirect_to_next_product
    product = next_product

    if product
      redirect_to product_path(next_product)
    else
      redirect_to deckend_products_path
    end
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end
end
