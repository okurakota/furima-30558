class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end


  private

  def product_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end

end
