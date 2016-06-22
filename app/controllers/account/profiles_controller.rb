class Account::ProfilesController < ApplicationController

  def show
    @products = current_user.products.all

  end

  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to account_profile_path, notice: 'Profile was successfully updated.'
    else
      flash[:notice] = "Profile not updated, please try again."
      render :show
  end

  end

  private

  def profile_params
    params.require(:user).permit(:street, :zip_code, :city)
  end

end
