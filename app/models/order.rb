class Order

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_user, :item_id, :user_id, :token

  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  def save
    item_user = ItemUser.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_user_id: item_user.id)
  end
end