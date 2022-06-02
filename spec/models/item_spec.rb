require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it '商品画像・商品名・商品の説明・販売価格があり、カテゴリー・商品の状態・配送料の負担・発送減の地域・発送までの日数が[---]以外であれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'ユーザーが紐付いていないと商品を出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像がないと出品できない' do
        @item.image = nil
        expect(@item.valid?).to eq(false)
        expect(@item.image.attached?).to eq(false)
      end
      it 'productが空だと登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'productが40文字以上だと登録できない' do
        @item.product = 'test' * 11
        @item.valid?
        expect(@item.errors.full_messages).to include("Product is too long (maximum is 40 characters)")
      end
      it 'explainが空だと登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'explainが1000文字以上だと登録できない' do
        @item.explain = 'sample' * 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain is too long (maximum is 1000 characters)")
      end
      it 'categoryが[---]だと登録できない' do
        @item.category=Category.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")  
      end
      it 'stateが[---]だと登録できない' do
        @item.state = State.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it 'delivery_cost_statusが[---]だと登録できない' do
        @item.delivery_cost_status = DeliveryCostStatus.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost status can't be blank")  
      end
      it 'prefectureが[---]だと登録できない' do
        @item.prefecture = Prefecture.find(0)
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_waiting_timeが[---]だと登録できない' do
        @item.delivery_waiting_time = DeliveryWaitingTime.find(1)
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery waiting time can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")  
      end
      it 'priceが300以内だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")  
      end
      it 'priceが9999999以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字以外だと登録できない' do
        @item.price = "test"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
