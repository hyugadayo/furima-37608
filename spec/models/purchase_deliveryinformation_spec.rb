require 'rails_helper'

RSpec.describe PurchaseDeliveryinformation, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_deliveryinformation = FactoryBot.build(:purchase_deliveryinformation, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'tokenと全ての値が正しく入力できれば保存できること' do
        expect(@purchase_deliveryinformation).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_deliveryinformation.building = ''
        expect(@purchase_deliveryinformation).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @purchase_deliveryinformation.postal_code = ''
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_deliveryinformation.postal_code = '1234567'
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_deliveryinformation.prefecture_id = 0
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @purchase_deliveryinformation.city = ''
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @purchase_deliveryinformation.address = ''
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_deliveryinformation.phone_number = ''
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角数値のみしか保存できない' do
        @purchase_deliveryinformation.phone_number = 'テスト1234テスト'
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは10桁、11桁以外は保存できない' do
        @purchase_deliveryinformation.phone_number = '12345'
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_deliveryinformation.user_id = nil
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_deliveryinformation.item_id = nil
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できないこと' do
        @purchase_deliveryinformation.token = nil
        @purchase_deliveryinformation.valid?
        expect(@purchase_deliveryinformation.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
