class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :status_id, :shopping_cost_id, :prefecture_id, :shopping_day_id, :price).merge(user_id: current_user.id)
  end
end
