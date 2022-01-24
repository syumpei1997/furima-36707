class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :image_information
  has_one    :shipping

end
