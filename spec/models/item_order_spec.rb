require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)  # Item_orderのインスタンス生成
  end

  describe '商品購入機能' do
    context '商品購入がうまくいく時' do
      it "postcodeとprefecture_id、city、housenum、phonenum、tokenが存在すれば登録できる" do
        expect(@item_order).to be_valid
      end
      it "buildnameが無くても登録できる" do
        @item_order.buildname = nil
        expect(@item_order).to be_valid
      end
    end

    context '商品購入ががうまくいかない時' do
      it "tokenが空では登録できないこと" do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号がないと登録できない" do
        @item_order.postcode = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid. Include hyphen(-)")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @item_order.postcode = "1111111"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include( "Postcode is invalid. Include hyphen(-)")
      end
      it "都道府県の選択肢に『----』が選択されている場合は登録できない" do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "市区町村がないと登録できない" do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it "番地がないと登録できない" do
        @item_order.housenum = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Housenum can't be blank")
      end
      it "電話番号がないと登録できない" do
        @item_order.phonenum = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phonenum can't be blank", "Phonenum is invalid")
      end
      it "電話番号にハイフンがあると登録できない" do
        @item_order.phonenum = "000-0000-0000"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phonenum is invalid")
      end
      it "電話番号が11桁以上あると登録できない" do
        @item_order.phonenum = "000000000000"
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phonenum is invalid")
      end
    end
  end
end