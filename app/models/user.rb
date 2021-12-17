class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, format: { with: 正規表現 , message: '全角日本語'}
         validates :nickname, presence: true, length: { maximum: 6 }
         validates :furigana_name, presence: true, format: { with: 正規表現 , message: '全角カタカナ'}
         validates :furigana_last_name, presence: true, format: { with: 正規表現 , message: '全角カタカナ'}
         validates :last_name, presence: true, format: { with: 正規表現 , message: '全角日本語'}
         validates :birthday, presence: true
         validates :encrypted_password, presence: true、format: { with: 正規表現 , message: 'エラーメッセージ'}
