class ImageInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one    :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :delivery, :nissuu, :prefecture, :status
end
