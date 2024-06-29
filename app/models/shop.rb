class Shop < ApplicationRecord
  has_many :shoe_shops, dependent: :destroy
  has_many :shoes, through: :shoe_shops, foreign_key: :shoe_id, dependent: :destroy
end
