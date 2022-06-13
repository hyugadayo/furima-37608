require 'rails_helper'

RSpec.describe PurchaseDeliveryinformation, type: :model do
  describe "配送先情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_deliveryinformation = FactoryBot.build(:purchase_deliveryinformation, user_id: user.id, item_id: item.id)
    end

    context "内容に問題ない場合" do
      it '全ての値が正しく入力できれば保存できること' do
        expect(@purchase_deliveryinformation).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_deliveryinformation.building = ''
        expect(@purchase_deliveryinformation).to be_valid
      end
    end

    context "内容に問題がある場合" do
      it "postal_coseが空だと保存できない" do
        
      end
      it "postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない" do
        
      end
      it "半角数値でないと保存できない" do
        
      end
      it "prefectureがないと保存できない" do
        
      end
      it "cityが空だと保存できない" do
        
      end
      it "addressが空だと保存できない" do
        
      end
      it "phone_numberが空だと保存できない" do
        
      end
      it "phone_numberにハイフンが含まれていると登録できない" do
        
      end
      it "phone_numberは10桁以下11桁以上だと保存できない" do
        
      end
      it "phone_numberは半角数値だけしか保存できない" do
        
      end
      it "user_idが紐付いていないと保存できない" do
        
      end
      it "item_idが紐付いていないと登録できない" do
        
      end
    end
  end
end
