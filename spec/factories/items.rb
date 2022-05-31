FactoryBot.define do
  factory :item do
    product { '商品名' }
    explain { '商品名の説明' }
    category { Category.find(2) }
    state { State.find(2) }
    delivery_cost_status { DeliveryCostStatus.find(2) }
    prefecture { Prefecture.find(2) }
    delivery_waiting_time { DeliveryWaitingTime.find(2) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
