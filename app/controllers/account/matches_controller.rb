class Account::MatchesController < ApplicationController
  def index
    @matches = current_user.matches.all
  end

  def show
    @message = Message.new
    @match = current_user.matches.find(params[:id])
    @match_since = @match.created_at.strftime('%d %b %Y')
    appreciation = @match.appreciation
    secondary_appreciation = @match.secondary_appreciation
    # @other_user = @match.appreciation.user


    # if I created the appreciation, then I liked the product of the other one
    # so my product is in the secondary appreciation
    if appreciation.user == current_user
      @product = secondary_appreciation.product
      @other_product = appreciation.product
      @other_user = secondary_appreciation.user
    else
      @product = appreciation.product
      @other_product = secondary_appreciation.product
      @other_user = appreciation.user
    end
  end
end


