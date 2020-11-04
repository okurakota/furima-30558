class PurchasesController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
      @address_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefectures_id, :municipalities, :addresses, :building_name, :phone_number, :purchase_id, :user_id, :product_id).merge(user_id: current_user.id)
  end
end