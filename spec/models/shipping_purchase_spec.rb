require 'rails_helper'

RSpec.describe ShippingPurchase, type: :model do
  before do
    @image_information = FactoryBot.create(:image_information)
    @user = FactoryBot.create(:user)
    @shipping_purchase = FactoryBot.build(:shipping_purchase, image_information_id: @image_information.id, user_id: @user.id)
    sleep 1
  end
  describe '商品購入機能' do
    context '購入できる場合' do
      it "postalとprefecture_idとmunicipalityとphoneとaddressとtokenが存在すれば購入できる" do
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
      it "建物名の入力がなくても登録できること" do
        @shipping_purchase.building = ''
        expect(@shipping_purchase).to be_valid
      end
    end  
    context '新規作成できない場合' do
      it "user_idが空では購入できないこと" do
        @shipping_purchase.user_id = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("User can't be blank")
      end
      it "image_information_idが空では購入できないこと" do
        @shipping_purchase.image_information_id = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Image information can't be blank")
      end
      it "postalが空では作成できない" do
        @shipping_purchase.postal = ''
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Postal can't be blank")
      end
      it "postalがハイフンなしの場合購入できない" do
        @shipping_purchase.postal = '1234567'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Postal is invalid")
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
      it "phoneが9桁以下では購入できない" do
        @shipping_purchase.phone = '1'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Phone is invalid")
      end
      it "12桁以上では購入できない" do
        @shipping_purchase.phone = '11111111111111'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Phone is invalid")
      end
      it "半角数字以外が含まれている場合は購入できない" do
        @shipping_purchase.phone = 'あああ'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Phone is invalid")
      end
      it "prefecture_idが1の選択だと作成できない" do
        @shipping_purchase.prefecture_id = '1'
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @shipping_purchase.token = nil
        @shipping_purchase.valid?
        expect(@shipping_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
