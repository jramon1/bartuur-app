class Account::ProfilesController < ApplicationController

  def show
    @products = current_user.products.all
  end

  def edit
  end

  def update
  end
end
