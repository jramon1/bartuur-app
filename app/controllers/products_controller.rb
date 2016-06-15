class ProductsController < ApplicationController

  def product_params
    params.require(:product).permit(:name, :description, photos: [])
  end

end
