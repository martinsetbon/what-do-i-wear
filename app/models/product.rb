class Product < ApplicationRecord
  # after_validation :generate_description, on: :update
  has_many :outfit_products
  has_many :outfits, through: :outfit_products
  has_many :closet_items
  has_many :users, through: :closet_items
  has_one_attached :photo

  validates :name, :price, :product_type, :image, :url, :season, :style, :gender, presence: true
  validates :product_type, inclusion: { in: %w(top bottom shoes accessories headwear), message: "%{value} is not a valid type" }
  validates :season, format: { with: /\A(summer|spring|winter|fall)(, (summer|spring|winter|fall))*\z/, message: "%{value} is not a valid season" }
  validates :style, format: { with: /\A(formal|casual)(, (formal|casual))*\z/, message: "%{value} is not a valid style" }
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not a valid gender" }


  def link_url
    "https://www.farfetch.com#{url}"
  end

  def generate_description
    DescribeProduct.new(photo.url).call
  end
end
