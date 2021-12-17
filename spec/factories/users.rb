FactoryBot.define do
  factory :user do
    name                  {'test'}
    nickname              {'test'}
    furigana_name         {'test'}
    furigana_last_name    {'test'}
    last_name             {'test'}
    birthday              {'0000'}
    password              {'000000'}
    password_confirmation {'password'}
  end
end