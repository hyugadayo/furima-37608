class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_cost_status
  belongs_to :prefecture
  belongs_to :delivery_waiting_time
  belongs_to :user
  has_one_attached :image

  validates :product, presence: true
  validates :explain, presence: true
  validates :category_id, numericality: {other_than: 1, message: "can't be blank"} 
  validates :state_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_cost_status_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: {other_than: 0,message: "can't be blank"}
  validates :delivery_waiting_time_id, numericality: {other_than:1, message: "can't be blank""'"}
  validates :image, presence: true
end
