class ItemUser < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :delivery_adress
  has_one :oreder
end
