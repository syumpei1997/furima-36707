require 'rails_helper'

RSpec.describe ImageInformation, type: :model do
  before do
    @image_information = FactoryBot.build(:image_information)
end

describe '商品出品' do
  context '出品できる場合' do
    it "imageとimage_nameとimage_explanationとcategory_idとstatus_idとdelivery_idとprefecture_idとnissuu_idとpriceが存在すれば登録できる" do
      expect(@image_information).to be_valid
    end
    it "priceが半角数値のみ保存可能" do
      @image_information.price = '301'
      expect(@image_information).to be_valid
    end
    it "priceが¥300~¥9,999,999の間のみ保存可能" do
      @image_information.price = '301'
      expect(@image_information).to be_valid
    end
  end

  context '新規作成できない場合' do
    it "imageが空では作成できない" do
      @image_information.image = nil
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Image can't be blank")
    end
    it "image_nameが空では作成できない" do
      @image_information.image_name = ''
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Image name can't be blank")
    end
    it "image_explanationが空では作成できない" do
      @image_information.image_explanation = ''
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Image explanation can't be blank")
    end
    it "category_idが1の選択だと作成できない" do
      @image_information.category_id = '1'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Category can't be blank")
    end
    it "status_idが1の選択だと作成できない" do
      @image_information.status_id = '1'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Status can't be blank")
    end
    it "delivery_idが1の選択だと作成できない" do
      @image_information.delivery_id = '1'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Delivery can't be blank")
    end
    it "prefecture_idが1の選択だと作成できない" do
      @image_information.prefecture_id = '1'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "nissuu_idが1の選択だと作成できない" do
      @image_information.nissuu_id = '1'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Nissuu can't be blank")
    end
    it "priceが空では作成できない" do
      @image_information.price = ''
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが半角数字以外の値が含まれている場合は保存できないこと" do
      @image_information.price = '３００'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが300未満の値では保存できないこと" do
      @image_information.price = '200'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが10000000以上の値では保存できないこと" do
      @image_information.price = '10000001'
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include("Price can't be blank")
    end
    it 'ユーザーが紐付いていなければ投稿できない' do
      @image_information.user = nil
      @image_information.valid?
      expect(@image_information.errors.full_messages).to include('User must exist')
    end
  end
 end
end
