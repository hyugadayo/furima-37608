class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_cost_status
  belongs_to :prefecture
  belongs_to :delivery_waiting_time
  belongs_to :user
  has_one :purchase
  has_many_attached :images

  validates :product, presence: true, length: { maximum: 40 }
  validates :explain, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_cost_status_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_waiting_time_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :images, presence: true
  validates :price, presence: true, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
