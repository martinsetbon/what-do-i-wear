class Outfit < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :outfit_products, dependent: :destroy
  has_many :products, through: :outfit_products

  # Optional fields
  validates :name, presence: true
  # validates :photo, presence: { message: "can't be blank. Please upload a photo." }
  validates :budget, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :season, inclusion: { in: %w(summer fall winter spring), message: "%{value} is not a valid season" }, allow_nil: true
  validates :style, inclusion: { in: %w(casual formal), message: "%{value} is not a valid style" }, allow_nil: true
  validates :gender, inclusion: { in: %w(male female unisex), message: "%{value} is not a valid gender" }, allow_nil: true

  def top
    self.outfit_products.find { |op| op.product.product_type == 'top' }
  end

  def bottom
    self.outfit_products.find { |op| op.product.product_type == 'bottom' }
  end

  def shoes
    self.outfit_products.find { |op| op.product.product_type == 'shoes' }
  end

  def sum
    self.products.sum(&:price)
  end
end
