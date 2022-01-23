class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone, :user_id, :image_information_id, :token

  validate :user_id
  validates :postal, presence: true
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, presence: true
  validates :prefecture_id,      presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true

    def save
      purchase = Purchase.create(image_information_id: image_information_id, user_id: user_id)
      Shipping.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone, purchase_id: purchase.id)
    end

end