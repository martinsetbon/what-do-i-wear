class Outfit < ApplicationRecord
  # after_create :generate_embedding
  # attr_accessor :top, :bottom, :shoe
  belongs_to :user
  has_one_attached :photo
  has_many :outfit_products, dependent: :destroy
  has_many :products, through: :outfit_products

  # Optional fields
  validates :name, presence: true
  # validates :photo, presence: { message: "can't be blank. Please upload a photo." }
  # validate :limit_products
  validates :budget, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :season, inclusion: { in: %w(summer fall winter spring), message: "%{value} is not a valid season" }, allow_nil: true
  validates :style, inclusion: { in: %w(casual formal), message: "%{value} is not a valid style" }, allow_nil: true
  validates :gender, inclusion: { in: %w(male female unisex), message: "%{value} is not a valid gender" }, allow_nil: true


  def generate_description
    DescribeUploadedPicture.new(photo.url).call
  end

  def generate_embedding
    description = generate_description
    clean_description = description.gsub("```json", "").gsub("```","")
    result = JSON.parse(clean_description)
    client = OpenAI::Client.new
    top_embedding = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: "Product: #{result["top"]["name"]}. Description: #{result["top"]["description"]}"
      }
    )
    embedding = top_embedding['data'][0]['embedding']
    update(top_embedding: embedding)

    client = OpenAI::Client.new
    bottom_embedding = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: "Product: #{result["bottom"]["name"]}. Description: #{result["bottom"]["description"]}"
      }
    )
    embedding = bottom_embedding['data'][0]['embedding']
    update(bottom_embedding: embedding)

    client = OpenAI::Client.new
    shoes_embedding = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: "Product: #{result["shoes"]["name"]}. Description: #{result["shoes"]["description"]}"
      }
    )
    embedding = shoes_embedding['data'][0]['embedding']
    update(shoes_embedding: embedding)
  end

  def nearest_tops
    return Product.nearest_neighbors(
        :embedding, top_embedding,
        distance: "euclidean"
      ).top.limit(10)
  end

  def nearest_bottoms
    return Product.nearest_neighbors(
        :embedding, bottom_embedding,
        distance: "euclidean"
      ).bottom.limit(10)
  end

  def nearest_shoes
    return Product.nearest_neighbors(
        :embedding, shoes_embedding,
        distance: "euclidean"
      ).shoes.limit(10)
  end

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

  private

# def limit_products
#   if outfit_products.size > 3
#     errors.add(:outfit_product, "you can only attach 3 products to an outfit")
#   end
# end
end
