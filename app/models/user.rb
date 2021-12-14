class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :image_informations
         has_many :purchases
         validates :name, presence: true
         validates :nickname, presence: true, length: { maximum: 6 }
         validates :furigana_name, presence: true
         validates :furigana_last_name, presence: true
         validates :last_name, presence: true
         validates :birthday, presence: true
end
