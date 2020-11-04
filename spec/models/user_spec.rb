require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
       it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

       it "emailが空では登録できないこと" do
         @user.email = nil
         @user.valid?
         expect(@user.errors.full_messages).to include("Email can't be blank")
       end

       it "重複したemailが存在する場合登録できないこと" do
         @user.save
         another_user = FactoryBot.build(:user)
         another_user.email = @user.email
         another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
       end

       it 'emailに@が含まれていなければ登録できないこと' do
        @user.email = 'sample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

       it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
       end

       it 'password:半角英数混合(半角英語のみ)' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      # it "名前が空では登録できない" do
      #   @user.first_name = nil
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First name can't be blank")
      # end

      it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      # it "ユーザー本名のフリガナの名前が空では登録できない" do
      #   @user.first_name_kana = nil
      #   @user.valid?
      #   expect(@user.errors.full_messages).to include("First name kana can't be blank")
      # end

      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須である" do
        @user.last_name = 'ぁ-んァ-ン一-龥'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
        @user.first_name = 'ぁ-んァ-ン一-龥'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.last_name_kana = 'ァ-ン一'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")
        @user.first_name_kana = 'ァ-ン一'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end

      it '生年月日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  
end
