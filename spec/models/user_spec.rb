require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it "nameとnicknameとfurigana_nameとfurigana_last_nameとlast_nameとbirthdayとemailとpasswordとpassword_confirmationが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上、半角英数字であれば登録できる' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa111'
      expect(@user).to be_valid
    end
  end
  context '新規登録できない場合' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nameが半角文字が含まれている場合は登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'furigana_nameが空では登録できない' do
      @user.furigana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana name can't be blank")
    end
    it 'furigana_nameがカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
      @user.furigana_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana name can't be blank")
    end
    it 'furigana_last_nameが空では登録できない' do
      @user.furigana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
    end
    it 'furigana_last_nameがカタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できない' do
      @user.furigana_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Furigana last name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが半角文字が含まれている場合は登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6文字以上でないと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが数字のみでは登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが全角だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが@が含まれていないと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa211'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user, email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
   end
  end
end
