class ProductsController < ApplicationController

  before_action :find_product, only: [:show, :show_description]

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
  end

  def show_description
    @user = @product.user

  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
