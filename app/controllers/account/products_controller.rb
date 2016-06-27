class Account::ProductsController < ApplicationController
  # before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_user.products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      flash[:success] = "Succesfully added your product"
      redirect_to_next_product
    else
      render :new
    end
  end

  def edit
    @product = current_user.products.find(params[:id])
  end

  def show
    @product = current_user.products.find(params[:id])
  end

  def update
    @product = current_user.products.find(params[:id])
    @product.update(product_params)
    redirect_to account_profile_path
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
  end

  private

    def product_params
      params.require(:product).permit(
        :name,
        :description,
        :value,
        photos: []
      )
    end

  # def set_account
  #   @account = User.find(params[:id])
  # end

end
