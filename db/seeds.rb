require "open-uri"

# Destroy existing records to avoid duplication
OutfitProduct.destroy_all
puts "Outfit products deleted"
Outfit.destroy_all
puts "Outfits deleted"
ClosetItem.destroy_all
puts "Closet items deleted"
Product.destroy_all
puts "Products deleted"
User.destroy_all
puts "Users deleted"

# Create some users
users = User.create!([
  { email: 'user1@example.com', password: 'password123' },
  { email: 'user2@example.com', password: 'password123' },
  { email: 'user3@example.com', password: 'password123' }
])
puts "Users created"

url = "https://www.farfetch.com/shopping/men/denim-2/items.aspx"
products_bottom = ClothesScraperService.scrape_clothes(url)

products_bottom.first(3).each do |bottom|
  p bottom
file = URI.parse(bottom[:image]).open
bottom.delete(:image)
product = Product.new(bottom)
product.photo.attach(io: file, filename: "#{bottom[:name]}.png", content_type: "image/png")
product.product_type = "bottom"
product.save!
p "#{product.name} has been created"
end

url = "https://www.farfetch.com/shopping/men/shoes-2/items.aspx"
products_shoes = ClothesScraperService.scrape_clothes(url)

products_shoes.first(3).each do |shoes|
file = URI.parse(shoes.image).open
product = Product.new(shoes)
product.photo.attach(io: file, filename: "#{shoes.name}.png", content_type: "image/png")
product.product_type = "shoes"
product.save!
p "#{product.name} has been created"
end


url = "https://www.farfetch.com/shopping/men/jackets-2/items.aspx"
products_top = ClothesScraperService.scrape_clothes(url)
file = URI.parse(top.image).open
products_top.first(3).each do |top|
product = Product.new(top)
product.photo.attach(io: file, filename: "#{top.name}.png", content_type: "image/png")
product.product_type = "top"
product.save!
p "#{product.name} has been created"
end


url = "https://www.farfetch.com/shopping/men/t-shirts-vests-2/items.aspx"
products_top = ClothesScraperService.scrape_clothes(url)
file = URI.parse(top.image).open
products_top.first(3).each do |top|
product = Product.new(top)
product.photo.attach(io: file, filename: "#{top.name}.png", content_type: "image/png")
product.product_type = "top"
product.save!
p "#{product.name} has been created"
end


url = "https://www.farfetch.com/shopping/men/sweaters-knitwear-2/items.aspx"
products_top = ClothesScraperService.scrape_clothes(url)
file = URI.parse(top.image).open
products_top.first(3).each do |top|
product = Product.new(top)
product.photo.attach(io: file, filename: "#{top.name}.png", content_type: "image/png")
product.product_type = "top"
product.save!
p "#{product.name} has been created"
end




# # Now, assign products to users' closet items and outfits

users.each do |user|
  # Closet items: 1 random item from each type
  %w(top bottom shoes).each do |type|
    product = Product.where(product_type: type).sample
    ClosetItem.create!(user: user, product: product)
  end

  # Create outfits for each user
  2.times do  # Create 2 outfits per user
    outfit = Outfit.create!(
      user: user,
      name: Faker::Lorem.words(number: 2).join(' '),
      budget: rand(1000..5000),
      season: %w(summer fall winter spring).sample,
      style: %w(casual formal).sample,
      gender: %w(male female unisex).sample
    )

    # Add 1 random product per type to the outfit
    %w(top bottom shoes).each do |type|
      product = Product.where(product_type: type).sample
      OutfitProduct.create!(outfit: outfit, product: product)
    end
  end
end


puts "Seeds created successfully"
