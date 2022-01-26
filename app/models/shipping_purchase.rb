class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone, :user_id, :image_information_id, :token

  with_options presence: true do
  validates :user_id
  validates :image_information_id
  validates :postal
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }, allow_blank: true
  validates :prefecture_id
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality
  validates :address
  validates :phone
  validates :phone, format: { with: /\A\d{10,11}\z/ }, allow_blank: true
  validates :token
  end

    def save
      purchase = Purchase.create(image_information_id: image_information_id, user_id: user_id)
      Shipping.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone, purchase_id: purchase.id)
    end

end
