class AppreciationsController < ApplicationController

  def create
    @appreciation = current_user.appreciations.where(product_id: params[:product_id]).first_or_create do |appreciation|
      appreciation.liked = appreciation_params[:liked]
    end

    # @appreciation = Appreciation.new(appreciation_params)
    # @appreciation.product_id = params[:product_id]
    # @appreciation.user = current_user

    if @appreciation.save
      check_for_matching

      if @matching_appreciations.any?
        flash[:notice] = "Match!!"
        return redirect_to account_matches_path
      end
    else
      flash[:alert] = 'Oops, an error just occured!'
    end

    redirect_to_next_product
  end

  private

  def check_for_matching
    # do not try to make a Match if user disliked the product
    return if @appreciation.liked == false

    appreciated_product      = @appreciation.product
    other_user_appreciations = appreciated_product.user.appreciations

    # Find the first matching liked appreciation
    # on one of our products with same value
    @matching_appreciations = other_user_appreciations.
      joins(:product).
      where(
        liked: true,
        products: {
          user_id:   current_user.id,
          delivered: false,
          value:     appreciated_product.value
        }
      )

    return if @matching_appreciations.empty?

    # Creating the Matches
    @matching_appreciations.each do |matching_appreciation|
      Match.create!(
        appreciation:           @appreciation,
        secondary_appreciation: matching_appreciation,
        code:                   SecureRandom.hex(3).upcase
      )
    end
  end

  def appreciation_params
    params.require(:appreciation).permit(:liked)
  end
end
