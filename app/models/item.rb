class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :postage_id
  belongs_to :prefecture_id
  belongs_to :prepareday_id
  belongs_to :user
  has_one_attached :image

  validates :category_id, :condition_id, :postage, :prefecture_id, :prepare_day_id, presence: true
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :prepare_day_id, numericality: { other_than: 1 } 
end
