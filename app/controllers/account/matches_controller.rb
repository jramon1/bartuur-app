class Account::MatchesController < ApplicationController
  def index
    @matches = current_user.matches.all
  end

  def show
    @match = current_user.matches.find(params[:id])
    appreciation = @match.appreciation
    secondary_appreciation = @match.secondary_appreciation

    # if I created the appreciation, then I liked the product of the other one
    # so my product is in the secondary appreciation
    if appreciation.user == current_user
      @product = secondary_appreciation.product
      @other_product = appreciation.product
    else
      @product = appreciation.product
      @other_product = secondary_appreciation.product
    end
  end
end

