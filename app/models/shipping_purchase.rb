class ShippingPurchase
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipality, :address, :building, :phone, :user_id

  validate :user_id
  validates :postal, presence: true
  validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :phone, format: { with: /\A\d{10,11}\z/ }

    def save
      purchase = Purchase.create(price: price, user_id: user_id, credit: credit)
      Shipping.create(postal: postal, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone: phone, purchase_id: purchase.id)
    end

end
