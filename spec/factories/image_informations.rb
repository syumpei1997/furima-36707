FactoryBot.define do
  factory :image_information do
    image_name           {'テスト'}
    image_explanation    {'テスト'}
    category_id          {'2'}
    status_id            {'2'}
    delivery_id          {'2'}
    prefecture_id        {'1'}
    nissuu_id            {'1'}
    price                {'300'}
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
