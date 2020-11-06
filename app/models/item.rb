class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  has_many :prefectures
  has_many :prepareday
  belongs_to :user
  has_one_attached :image

  validates :category_id, :condition_id, :postage, :prefecture_id, :prepare_day_id, :name, :explanation, :image, presence: true
  validates :category_id, :condition_id, :postage_id, :prefecture_id, :prepare_day_id, numericality: { other_than: 1 } 
  
  VALID_PRICEL_HALF =                 /\A[0-9]+\z/
  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
  greater_than: 300, less_than: 9999999}

end
