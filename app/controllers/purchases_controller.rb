class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:index, :create]

  def index
    if @product.purchase.present? || current_user == @product.user
      redirect_to root_path
    end
  end

  def create
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :purchase_id, :user_id, :product_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
