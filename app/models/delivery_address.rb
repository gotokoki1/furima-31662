class DeliveryAddress < ApplicationRecord
  belongs_to :item_user
  has_one :order
end
