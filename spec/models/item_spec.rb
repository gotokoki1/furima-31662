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

      it "カテゴリーの情報が1では登録できない" do
        @item.category_id =  1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態についての情報が1では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it "配送料の負担についての情報が1では登録できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage must be other than 1")
      end

      it "発送元の地域についての情報が1では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "発送までの日数についての情報が1では登録できない" do
        @item.prepare_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prepare day must be other than 1")
      end

      it "販売価格が299円以下では登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "販売価格が10,000,000以上では登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
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
