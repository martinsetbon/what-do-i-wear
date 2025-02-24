class Outfit < ApplicationRecord
  belongs_to :user
  has_many :outfit_products
  has_many :products, through: :outfit_products

  validates :name, presence: true

  # Optional fields
  validates :budget, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :season, inclusion: { in: %w(summer fall winter spring), message: "%{value} is not a valid season" }, allow_nil: true
  validates :style, inclusion: { in: %w(casual formal), message: "%{value} is not a valid style" }, allow_nil: true
  validates :gender, inclusion: { in: %w(male female androgynous), message: "%{value} is not a valid gender" }, allow_nil: true
end
