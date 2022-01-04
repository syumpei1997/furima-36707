FactoryBot.define do
  factory :image_information do
    association :user 
    image_name           {'テスト'}
    image_explanation    {'テスト'}
    category_id          {'2'}
    status_id            {'2'}
    delivery_id          {'2'}
    prefecture_id        {'2'}
    nissuu_id            {'2'}
    price                {'301'}
    after(:build) do |image_information|
      image_information.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
