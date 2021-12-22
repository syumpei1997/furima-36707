FactoryBot.define do
  factory :user do
    name                  {'あ'}
    nickname              {'aaa'}
    furigana_name         {'ア'}
    furigana_last_name    {'ア'}
    last_name             {'あ'}
    birthday              {'1930-01-01'}
    password              {'aaa111'}
    password_confirmation {'aaa111'}
    email                 {Faker::Internet.free_email}
  end
end