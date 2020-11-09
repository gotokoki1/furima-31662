class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :prepare_day
  belongs_to :user
  has_one_attached :image
  has_one :item_user

  validates :name, :explanation, :image, presence: true
  
  VALID_PRICEL_HALF =                 /\A[0-9]+\z/
  validates  :price,  presence: true, format: {with: VALID_PRICEL_HALF},length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
  greater_than: 300, less_than: 9999999}
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :prepare_day_id
  end
end
