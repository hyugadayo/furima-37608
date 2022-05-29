class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_cost_status
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image

  validates :category_id,nuwmericality: {other_than: 1, message: "can't be blank"} 
  validates :state_id,nuwmericality: {other_than: 1, message: "can't be blank"}
  validates :delivery_cost_status_id,nuwmericality: {other_than: 1, message: "can't be blank"}
  validates :prefecture_id,nuwmericality: {other_than: 0,message: "can't be blank"}
end
