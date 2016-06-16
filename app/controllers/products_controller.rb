class ProductsController < ApplicationController

  def show

    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, photos: [])
  end

end
