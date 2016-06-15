class Account::ProductsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def create
    @product = Product.create
  end

  def new
    @product = Product.new(product_params)
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
    @product = Product.destroy
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :photos)
    end

    def set_account
      @account = User.find(params[:id])
    end

end
