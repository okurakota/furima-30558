class AddressPurchase
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipalities, :addresses, :building_name, :phone_number, :purchase_id, :user_id, :product_id

  # ここにバリデーションの処理を書く
  validates :token, presence: true


  
  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: addresses, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end