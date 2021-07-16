require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の投稿' do
    context '商品を投稿できる場合' do
      it '全ての項目があれば投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を投稿できない場合' do
      it '画像が空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'タイトルが空では投稿できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '説明が空では投稿できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空では投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '状態が空では投稿できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空では投稿できない' do
        @item.fee_by_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee by can't be blank")
      end
      it '発送元の地域が空では投稿できない' do
        @item.from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("From can't be blank")
      end
      it '発送までの日数が空では投稿できない' do
        @item.timeline_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Timeline can't be blank")
      end
      it '価格が空では投稿できない' do
        @item.price= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円以下では投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円以上では投稿できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格が半角数字以外では投稿できない' do
        @item.price= "五百円"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
