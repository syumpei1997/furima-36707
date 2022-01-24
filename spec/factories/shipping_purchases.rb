FactoryBot.define do
  factory :shipping_purchase do
      # association :purchase
      token {"tok_abcdefghijk00000000000000000"}
      postal          {'123-4567'}
      prefecture_id   {'2'}
      municipality    {'テスト市'}
      phone           {'09012345678'}
      address         {'テスト'}
      building        {''}
  end
end
