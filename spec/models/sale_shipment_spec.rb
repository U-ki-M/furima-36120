require 'rails_helper'

RSpec.describe SaleShipment, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @sale_shipment = FactoryBot.build(:sale_shipment, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@sale_shipment).to be_valid
      end
      it '建物名は空でも保存できること' do
        @sale_shipment.bldg = ''
        expect(@sale_shipment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @sale_shipment.postal = ''
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Postal can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @sale_shipment.postal = '1231234'
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it '都道府県が空では投稿できない' do
        @sale_shipment.from_id = 1
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("From can't be blank")
      end
      it '市区町村が空では投稿できない' do
        @sale_shipment.city = ''
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では投稿できない' do
        @sale_shipment.street = ''
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Street can't be blank")
      end
      it 'Telが空だと保存できないこと' do
        @sale_shipment.tel = ''
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Tel can't be blank", "Tel is invalid")
      end
      it 'telが全角数字だと保存できないこと' do
        @sale_shipment.tel = '０９０１２３４１２３４'
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが10桁未満では保存できないこと' do
        @sale_shipment.tel = '090123456'
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが12桁以上では保存できないこと' do
        @sale_shipment.tel = '090123456789'
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Tel is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @sale_shipment.user_id = nil
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @sale_shipment.item_id = nil
        @sale_shipment.valid?
        expect(@sale_shipment.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end