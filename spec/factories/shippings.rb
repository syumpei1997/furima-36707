FactoryBot.define do
  factory :shipping do
    # association :purchase
    postal          {'123-4567'}
    prefecture_id   {'2'}
    municipality    {'テスト市'}
    phone           {'09012345678'}
    address         {'テスト'}
  end
end
