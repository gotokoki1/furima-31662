require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  it "購入する際の必須項目が全て存在すれば登録できる" do
    expect(@order).to be_valid
  end

  it "都道府県ついての情報が1では登録できない" do
    @order.prefecture_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it "郵便番号が空では登録できないこと" do
    @order.post_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Post code can't be blank")
  end

  it "市区町村が空では登録できないこと" do
    @order.city = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank")
  end

  it "番地が空では登録できないこと" do
    @order.house_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("House number can't be blank")
  end

  it "建物名が空でも登録できること" do
    @order.building_name = ""
    @order.valid?
  end

  it "電話番号が空では登録できないこと" do
    @order.phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank")
  end

end