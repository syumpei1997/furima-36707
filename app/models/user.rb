class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :nickname, presence: true
         validates :email, presence: true
         validates :
         | encrypted_password | string | null: false |
| furigana_name      | string | null: false |
| furigana_last_name | string | null: false |
| name               | string | null: false |
| last_name          | string | null: false |
| birthday           | date | null: false |

end
