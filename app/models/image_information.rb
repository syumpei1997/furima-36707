class ImageInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one    :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :delivery, :nissuu, :prefecture, :status
  
  validates :image,              presence: true
  validates :image_name,         presence: true
  validates :image_explanation,  presence: true
  validates :category,           presence: true
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank"} 
  validates :status,             presence: true
  validates :status_id,          numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery,           presence: true
  validates :delivery_id,        numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture,         presence: true
  validates :prefecture_id,      presence: true
  validates :nissuu,             presence: true
  validates :nissuu_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :price,              presence: true
  validates :price,              :numericality => {:only_integer => true}
  validates :price,              numericality: { less_than_or_equal_to: 300,greater_than_or_equal_to: 9_999_999 }
  validates :price,              format: { with: /\A[0-9]+\z/ , message: '半角数字'}
 

end
