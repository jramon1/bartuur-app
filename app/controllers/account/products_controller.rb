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
      # redirect_to account_products_path(@products)
      redirect_to product_path(Product.all.sample)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @product = current_user.products.find(params[:id])
  end

  def update
  end

  def destroy
    @product = current_user.products.find[:id]
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
