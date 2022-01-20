require 'rails_helper'

RSpec.describe ShippingPurchase, type: :model do
  before do
    @shipping_purchase = FactoryBot.build(:shipping_purchase)
  end
  describe '商品購入機能' do
    context '購入できる場合' do
      it "postalとprefecture_idとmunicipalityとphoneとaddressが存在すれば購入できる" do
        expect(@shipping_purchase).to be_valid
      end
      it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
        @shipping_purchase.postal = '123-4567'
        expect(@shipping_purchase).to be_valid
      end
      it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
        @shipping_purchase.phone = '09012345678'
        expect(@shipping_purchase).to be_valid
      end
    end  
    context '新規作成できない場合' do
      it "postalが空では作成できない" do
        @shipping_purchase.postal = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Postal can't be blank")
      end
      it "prefecture_idが空では作成できない" do
        @shipping_purchase.prefecture_id = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalityが空では作成できない" do
        @shipping_purchase.municipality = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it "addressが空では作成できない" do
        @shipping_purchase.address = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "phoneが空では作成できない" do
        @shipping_purchase.phone = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it "prefecture_idが1の選択だと作成できない" do
        @shipping_purchase.prefecture_id = '1'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
    end
  end
end
