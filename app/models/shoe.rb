class Shoe < ApplicationRecord
  has_many :shoe_shops
  has_many :shops, through: :shoe_shops, foreign_key: :shop_id
end
