require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.build(:user)
      product = FactoryBot.build(:product)
      @address_purchase = FactoryBot.build(:address_purchase, user_id: user, product_id: product)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@address_purchase).to be_valid
    end
    it 'building_nameが空でも保存できること' do
      @address_purchase.building_name = nil
      expect(@address_purchase).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @address_purchase.token = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @address_purchase.postal_code = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと保存できないこと' do
      @address_purchase.postal_code = '1234567'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefectures_idが空だと保存できないこと' do
      @address_purchase.prefectures_id = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Prefectures can't be blank")
    end
    it 'prefectures_idが1だと保存できないこと' do
      @address_purchase.prefectures_id = '1'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include('Prefectures must be other than 1')
    end
    it 'municipalitiesが空だと保存できないこと' do
      @address_purchase.municipalities = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @address_purchase.address = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @address_purchase.phone_number = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @address_purchase.phone_number = '012345678910'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberにハイフンがあると保存できないこと' do
      @address_purchase.phone_number = '123-4567-8910'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
