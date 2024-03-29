class ImageInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one    :purchase
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :nissuu
  belongs_to :prefecture
  belongs_to :status

  validates :image,              presence: true
  validates :image_name,         presence: true
  validates :image_explanation,  presence: true
  validates :category_id,        presence: true,numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id,          presence: true,numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_id,        presence: true,numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id,      presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :nissuu_id,          presence: true,numericality: { other_than: 1, message: "can't be blank" }
  validates :price,              :numericality => {:only_integer => true, allow_blank: true, message: "can't be blank"}
  validates :price,              numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999, allow_blank: true, message: "can't be blank"}
  validates :price,              format: { with: /\A[0-9]+\z/, allow_blank: true, message: "can't be blank"}
  validates :price,              presence: true

end
