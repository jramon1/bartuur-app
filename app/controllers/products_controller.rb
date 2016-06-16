class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])

    @appreciation_positive          = Appreciation.new
    @appreciation_positive.product  = @product
    @appreciation_positive.liked    = true

    @appreciation_negative          = Appreciation.new
    @appreciation_negative.product  = @product
    @appreciation_negative.liked    = false

  end

  def product_params
    params.require(:product).permit(:name, :description, photos: [])
  end



end
