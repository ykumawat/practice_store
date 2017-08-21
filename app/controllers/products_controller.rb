class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, category_ids: [])
  end
end
