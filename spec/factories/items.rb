FactoryBot.define do
  factory :item do
    product {商品名}
    explain{商品名の説明}
    category { Category.all.sample}
    state { State.all.sample}
    delivery_cost_status {DeliveryCostStatus.all.sample}
    prefecture { Prefecture.all.sample}
    delivery_waiting_time { DeliveryWaitingTime.all.sample}
    price {Faker::Number.between(from: 300, to: 9999999)}
  end
end
