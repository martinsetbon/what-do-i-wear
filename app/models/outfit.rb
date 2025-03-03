class Outfit < ApplicationRecord
  # after_commit :generate_description, on: :create
  attr_accessor :top, :bottom, :shoe
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


  def generate_description
    DescribeUploadedPicture.new(photo.url).call
  end
end
