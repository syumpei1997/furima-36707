require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it 'nameが空では登録できない' do
      # nameが空では登録できないテストコードを記述します
    end
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
    end
    it 'furigana_nameが空では登録できない' do
      # furigana_nameが空では登録できないテストコードを記述します
    end
    it 'furigana_last_nameが空では登録できない' do
      # furigana_last_nameが空では登録できないテストコードを記述します
    end
    it 'last_nameが空では登録できない' do
      # last_nameが空では登録できないテストコードを記述します
    end
    it 'birthdayが空では登録できない' do
      # birthdayが空では登録できないテストコードを記述します
    end
    it 'passwordが空では登録できない,６文字以上で半角英数字混合の入力でないと登録できない' do
      # passwordが空では登録できないテストコードを記述します
    end
    it 'password_confirmationが空では登録できない,passwordと値が一致しないと登録できない' do
      # password_confirmationが空では登録できないテストコードを記述します
    end
    it 'emailが空では登録できない,一意性であり@を含むこと' do
      # emailが空では登録できないテストコードを記述します
    end
  end
end
