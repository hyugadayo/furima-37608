class PurchaseDeliveryinformation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :address, :city, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', }
    validates :city,        format: { with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/ } # 全角ひらがな、全角カタカナ、漢字（鬼車）
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ } # 携帯番号(ハイフンなし10桁or11桁)
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Deliveryinformation.create(postal_code: postal_code, prefecture_id: prefecture_id, address: address, city: city,
                               building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
