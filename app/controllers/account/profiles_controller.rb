class Account::ProfilesController < ApplicationController

  def show
    @products = current_user.products.all

  end

  def edit
  end

  def update
    if @current_user.update(profile_params)
      redirect_to @current_user, notice: 'Profile was successfully updated.'
    else
      render :edit
  end

  end

  private

  def profile_params
    params.require(@current_user).permit(:street, :zip_code, :city)
  end

end
