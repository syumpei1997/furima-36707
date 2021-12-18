FactoryBot.define do
  factory :user do
    name                  {'test'}
    nickname              {'test'}
    furigana_name         {'test'}
    furigana_last_name    {'test'}
    last_name             {'test'}
    birthday              {'0000'}
    password              {'000aaa'}
    password_confirmation {'password'}
    email                 {'test@gmail.com'}
  end
end