class Product < ApplicationRecord
  after_commit :generate_description, on: :create
  has_many :outfit_products
  has_many :outfits, through: :outfit_products
  has_many :closet_items
  has_many :users, through: :closet_items
  has_one_attached :photo

  validates :name, :price, :product_type, :url, presence: true
  validates :product_type, inclusion: { in: %w(top bottom shoes accessories headwear), message: "%{value} is not a valid type" }

def generate_description
  description = DescribePhoto.new(photo.url).call
  update(description: description)
end

end
