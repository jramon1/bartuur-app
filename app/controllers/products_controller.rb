class ProductsController < ApplicationController

  def show
  end

  def product_params
    params.require(:product).permit(:name, :description, photos: [])
  end

end
