require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)  # Itemのインスタンス生成
  end

  describe '商品出品機能' do
    context '商品出品ががうまくいく時' do
      it "imageとproduct、description、category_id、status_id、burden_id、area_id、deliveryday_id、priceが存在すれば登録できる" do
       expect(@item).to be_valid
      end
    end

    context '商品出品ががうまくいかない時' do
      it "商品画像をつけていないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名がないと出品できない" do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it "商品説明文がないと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報がないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it "カテゴリーの選択肢に『----』が選択されている場合は出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "商品の状態についての情報がないと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it "商品の選択肢に『----』が選択されている場合は出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it "配送料の負担についての情報がないと出品できない" do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank", "Burden is not a number")
      end
      it "配送料の負担の選択肢に『----』が選択されている場合は出品できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it "発送元の地域についての情報がないと出品できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it "発送元の地域の選択肢に『----』が選択されている場合は出品できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "発送までの日数についての情報がないと出品できない" do
        @item.deliveryday_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank", "Deliveryday is not a number")
      end
      it "発送までの日数の選択肢に『----』が選択されている場合は出品できない" do
        @item.deliveryday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday must be other than 1")
      end
      it "販売価格についての情報がないと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "販売価格が半角数字以外の情報の場合は出品できない" do
        @item.price = "あaA１２３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end