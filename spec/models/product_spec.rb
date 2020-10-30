require 'rails_helper'
RSpec.describe Product do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'imageとnameとdescriptionとcategory_idとstatus_idとshopping_cost_idとprefecture_idとshopping_day_idとpriceが存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Category is not a number')
      end
      it 'status_idが空だと出品できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Status is not a number')
      end
      it 'shopping_cost_idが空だと出品できない' do
        @product.shopping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Shopping cost is not a number')
      end
      it 'prefecture_idが空だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'shopping_day_idが空だと出品できない' do
        @product.shopping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Shopping day is not a number')
      end
      it 'category_idが1だと出品できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1だと出品できない' do
        @product.status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shopping_cost_idが1だと出品できない' do
        @product.shopping_cost_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Shopping cost must be other than 1')
      end
      it 'prefecture_idが1だと出品できない' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'shopping_day_idが1だと出品できない' do
        @product.shopping_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include('Shopping day must be other than 1')
      end
      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥300以下だと出品できない' do
        @product.price = '0'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが¥9,999,999以上だと出品できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角数字以外だと出品できない' do
        @product.price = '９９９９９９９'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
