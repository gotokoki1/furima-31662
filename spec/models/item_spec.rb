require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do

      it "商品名が必須であること" do
        @item.name = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が必須であること" do
        @item.explanation = nil
        @item.valid? 
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーの情報が必須であること" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態についての情報が必須であること" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "配送料の負担についての情報が必須であること" do
        @item.postage_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数についての情報が必須であること" do
        @item.prepare_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prepare day can't be blank")
      end

      it "発送までの日数についての情報が必須であること" do
        @item.prepare_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prepare day can't be blank")
      end

      it "価格についての情報が必須であること" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "販売価格は半角数字のみ保存可能であること" do
        @item.price = '/\A[0-9]+\z/'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
end
