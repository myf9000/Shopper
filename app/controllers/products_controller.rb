class ProductsController < ApplicationController
  before_action :product_find, only: [:show, :edit, :delete, :update, :destroy]
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = current_user.products.build
  end

  def create
    # zadanie HTTP POST - tworznie nowego productu
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
  end


  def update
    # zadanie HTTP PUT - aktualizacja konkretnego produktu
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private 

  # po private metoda to helpers
  # bo moga sie do niej tylko odniesc metody w klasie

  def product_find
    @product = Product.find(params[:id])
  end

  # params jest tablica asocjacyjna 
  # ta funkcja filtruje z syfu paramsy i pozwala tylko istniec name
  # params to jest hash w hashu

  def product_params
    params.require(:product).permit(:name) 
  end
end
