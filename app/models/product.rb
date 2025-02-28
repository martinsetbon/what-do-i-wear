class Product < ApplicationRecord
  has_many :outfit_products
  has_many :outfits, through: :outfit_products
  has_many :closet_items
  has_many :users, through: :closet_items

  validates :name, :price, :product_type , :image, :url, presence: true
  validates :product_type, inclusion: { in: %w(top bottom shoes accessories headwear), message: "%{value} is not a valid type" }

  def link_url
    "https://www.farfetch.com#{url}"
  end
end
