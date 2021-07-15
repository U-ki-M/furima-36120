require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上かつ英数ミックスであれば登録できる' do
        @user.password = 'abc000'
        @user.password_confirmation = 'abc000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@なしでは登録できない' do
        @user.email = 'abcgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid") 
      end
      it '生年月日が空では登録できない' do
        @user.dob = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Dob can't be blank")
      end
      it 'surnameが空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'kana_surnameが空では登録できない' do
        @user.kana_surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana surname can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
         @user.kana_first_name = ''
         @user.valid?
         expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'surnameが半角文字では登録できない' do
        @user.surname = 'Brown'
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname is invalid")
      end
      it 'first_nameが半角文字では登録できない' do
        @user.first_name = 'Chris'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'kana_surnameが全角カタカナ以外では登録できない' do
        @user.kana_surname = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana surname is invalid")
      end
      it 'kana_first_nameが全角カタカナ以外では登録できない' do
        @user.kana_first_name= 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name is invalid")
      end
    end
  end

end
