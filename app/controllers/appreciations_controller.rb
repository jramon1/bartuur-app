class AppreciationsController < ApplicationController

  def create
    @appreciation = Appreciation.new(appreciation_params)
    @appreciation.product_id = params[:product_id]
    @appreciation.user = current_user

    unless @appreciation.save
      flash[:alert] = 'Oops, an error just occured!'
    end

    redirect_to product_path(Product.all.sample)
  end

  def appreciation_params
    params.require(:appreciation).permit(:liked)
  end
end
