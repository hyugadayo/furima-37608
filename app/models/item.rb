class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  validates :category_id,nuwmericality: {other_than: 1, message: "can't be blank"} 
end
