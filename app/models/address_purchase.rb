class AddressPurchase
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :purchase_id, :user_id, :product_id

  with_options presence: true do
    validates :token
    validates :postal_code,    format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :phone_number,   format: { with: /\A\d{10,11}\z/ }
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end