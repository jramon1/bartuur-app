class ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, photos: [])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
