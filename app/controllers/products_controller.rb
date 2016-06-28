class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :show_description]
  before_action :find_matches, only: [:show, :deckend]

  def deckend
  end

  def show
    @user = @product.user

    @appreciation_positive          = Appreciation.new
    @appreciation_positive.product  = @product
    @appreciation_positive.liked    = true

    @appreciation_negative          = Appreciation.new
    @appreciation_negative.product  = @product
    @appreciation_negative.liked    = false

    @distance = Geocoder::Calculations.distance_between([current_user.latitude, current_user.longitude], [@user.latitude, @user.longitude], units: :km)
  end

  def show_description
    @user = @product.user

  end

  private

  def find_matches
    match_ids = flash[:match_ids]
    return if match_ids.blank?

    @matches = current_user.matches.where(id: match_ids)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
