class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home

    # si le user a un produit rediriger vers la page
    #  show sinon redirige vers la creer un produit
    if current_user
      if current_user.products.empty?
        redirect_to account_products_path
      else
        redirect_to product_path(Product.all.sample)
      end
    end
  end
end
