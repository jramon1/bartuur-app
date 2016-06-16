class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    si le user a un produit rediriger vers la page
     show sinon redirige vers la creer un produit

    if current_user.product_id = nill
      redirect_to
  end
end
