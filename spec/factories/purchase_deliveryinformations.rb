FactoryBot.define do
  factory :purchase_deliveryinformation do
    postal_code {'123-4567'}
    prefecture_id { 2 }
    city {'東京都'}
    address {'1-1'}
    building {'東京ハイツ'}
    phone_number {12345678910}
  end
end
