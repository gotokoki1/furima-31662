class Order

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :item_user, :item, :user, :token

  validates :prefecture_code_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :post_code
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
    validates :item_user
    validates :token
  end

  def save
    Item_user.create(user_id: user.id, item_id: item.id)
    Address.create(post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_user: item_user.id)
  end
end