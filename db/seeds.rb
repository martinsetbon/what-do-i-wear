require "open-uri"

# Destroy existing records to avoid duplication
OutfitProduct.destroy_all
puts "Outfit products deleted"
Outfit.destroy_all
puts "Outfits deleted"
ClosetItem.destroy_all
puts "Closet items deleted"
User.destroy_all
puts "Users deleted"

# Create some users
users = User.create!([
  { email: 'user1@example.com', password: 'password123' },
  { email: 'user2@example.com', password: 'password123' },
  { email: 'user3@example.com', password: 'password123' }
])
puts "Users created"



# url = "https://www.farfetch.com/shopping/men/denim-2/items.aspx"
# url = "https://www.farfetch.com/shopping/men/denim-2/items.aspx?sort=4"
# men_products_jeans = ClothesScraperService.scrape_clothes(url)
# men_products_jeans.each do |jean|
#   begin
#   if Product.find_by(name: jean[:name])
#     p "Product already seeded"
#     next
#   end

#   file = URI.open(jean[:image])
#   product = Product.new(jean)
#   product.product_type = "bottom"
#   product.season = "winter, fall, spring"
#   product.style = "casual"
#   product.gender = "male"
#   product.save!
#   product.photo.attach(io: file, filename: "#{product.name}.jpg", content_type: "image/jpg")
#   unless product.photo.attached?
#     puts "Skipping #{product.name} - image attachment failed."
#     product.destroy
#     next
#   end
#   product.description = product.generate_description
#   rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
#     # Handle network/image fetching errors
#     puts "Skipping - Image is not accessible."
#     product.destroy if product && product.persisted?
#     next
#   end
# product.save!
# p "#{product.name} has been created"
# end



# # url = "https://www.farfetch.com/shopping/men/trousers-2/items.aspx"
# url = "https://www.farfetch.com/shopping/men/trousers-2/items.aspx?sort=4"
# men_products_trousers = ClothesScraperService.scrape_clothes(url)
# men_products_trousers.each do |trouser|
#   begin
#     if Product.find_by(name: trouser[:name])
#       p "Product already seeded"
#       next
#     end
#   file = URI.open(trouser[:image])
#   product = Product.new(trouser)
#   product.product_type = "bottom"
#   product.season = "summer, spring"
#   product.style = "casual"
#   product.gender = "male"
#   product.save!
#   product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
#   unless product.photo.attached?
#     # puts "Skipping #{product.name} - image attachment failed."
#     product.destroy
#     next
#   end
#   product.description = product.generate_description
#   rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
#     # Handle network/image fetching errors
#     puts "Skipping - Image is not accessible."
#     product.destroy if product && product.persisted?
#     next
#   end
# product.save!
# p "#{product.name} has been created"
# end


# # url = "https://www.farfetch.com/shopping/men/shorts-2/items.aspx"
# url = "https://www.farfetch.com/shopping/men/shorts-2/items.aspx?sort=4"
# men_products_shorts = ClothesScraperService.scrape_clothes(url)
# men_products_shorts.each do |short|
#   begin
#     if Product.find_by(name: short[:name])
#       p "Product already seeded"
#       next
#     end
#   file = URI.open(short[:image])
#   product = Product.new(short)
#   product.product_type = "bottom"
#   product.season = "summer"
#   product.style = "casual"
#   product.gender = "male"
#   product.save!
#   product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
#   unless product.photo.attached?
#     puts "Skipping #{product.name} - image attachment failed."
#     product.destroy
#     next
#   end
#   product.description = product.generate_description
#   rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
#     # Handle network/image fetching errors

#     puts "Skipping - Image is not accessible."
#     product.destroy if product && product.persisted?

#     next
#   end
# product.save!
# p "#{product.name} has been created"
# end


# # url = "https://www.farfetch.com/shopping/men/boots-2/items.aspx"
# url = "https://www.farfetch.com/shopping/men/boots-2/items.aspx?sort=4"
# men_products_boots = ClothesScraperService.scrape_clothes(url)
# men_products_boots.each do |boot|
#   begin
#     if Product.find_by(name: boot[:name])
#       p "Product already seeded"
#       next
#     end
#   file = URI.open(boot[:image])
#   product = Product.new(boot)
#   product.product_type = "shoes"
#   product.season = "winter"
#   product.style = "casual"
#   product.gender = "male"
#   product.save!
#   product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
#   unless product.photo.attached?
#     puts "Skipping #{product.name} - image attachment failed."
#     product.destroy
#     next
#   end
#   product.description = product.generate_description
#   rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
#     # Handle network/image fetching errors

#     puts "Skipping - Image is not accessible."
#     product.destroy if product && product.persisted?

#     next
#   end
# product.save!
# p "#{product.name} has been created"
# end


# # url = "https://www.farfetch.com/shopping/men/trainers-2/items.aspx"
# url = "https://www.farfetch.com/shopping/men/trainers-2/items.aspx?sort=4"
# men_products_sneakers = ClothesScraperService.scrape_clothes(url)
# men_products_sneakers.each do |sneaker|
#   begin
#     if Product.find_by(name: sneaker[:name])
#       p "Product already seeded"
#       next
#     end
#     file = URI.open(sneaker[:image])
#     product = Product.new(sneaker)
#     product.product_type = "shoes"
#     product.season = "fall, summer, spring"
#     product.style = "casual"
#     product.gender = "male"
#     product.save!
#     product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
#   unless product.photo.attached?
#     puts "Skipping #{product.name} - image attachment failed."
#     product.destroy
#     next
#   end
#   product.description = product.generate_description
#   rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
#     # Handle network/image fetching errors
#     puts "Skipping - Image is not accessible."
#     product.destroy if product && product.persisted?
#     next
#   end
# product.save!
# p "#{product.name} has been created"
# end



# # url = "https://www.farfetch.com/shopping/men/oxfords-2/items.aspx"
# url = "https://www.farfetch.com/shopping/men/oxfords-2/items.aspx?sort=4"
# men_products_oxfords = ClothesScraperService.scrape_clothes(url)
# men_products_oxfords.each do |oxford|
#   begin
#     if Product.find_by(name: oxford[:name])
#       p "Product already seeded"
#       next
#     end
#   file = URI.open(oxford[:image])
#   product = Product.new(oxford)
#   product.product_type = "shoes"
#   product.season = "fall, summer, spring"
#   product.style = "formal"
#   product.gender = "male"
#   product.save!
#   product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
#   unless product.photo.attached?
#     puts "Skipping #{product.name} - image attachment failed."
#     product.destroy
#     next
#   end
#   product.description = product.generate_description
#   rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
#     # Handle network/image fetching errors
#     puts "Skipping - Image is not accessible."
#     product.destroy if product && product.persisted?
#     next
#   end
# product.save!
# p "#{product.name} has been created"
# end




# url = "https://www.farfetch.com/shopping/men/jackets-2/items.aspx"
url = "https://www.farfetch.com/shopping/men/jackets-2/items.aspx?sort=4"
men_products_jackets = ClothesScraperService.scrape_clothes(url)
men_products_jackets.first(10)each do |jacket|
  begin
    if Product.find_by(name: jacket[:name])
      p "Product already seeded"
      next
    end
    file = URI.open(jacket[:image])
    product = Product.new(jacket)
    product.product_type = "top"
    product.season = "fall, winter"
    product.style = "casual"
    product.gender = "male"
    product.save!
    product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
    unless product.photo.attached?
      puts "Skipping #{product.name} - image attachment failed."
      product.destroy
      next
    end
    product.description = product.generate_description
    rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
    # Handle network/image fetching errors
    puts "Skipping - Image is not accessible."
    product.destroy if product && product.persisted?
    next
  end
product.save!
p "#{product.name} has been created"
end


# url = "https://www.farfetch.com/shopping/men/t-shirts-vests-2/items.aspx"
url = "https://www.farfetch.com/shopping/men/t-shirts-vests-2/items.aspx?sort=4"
men_products_tshirts = ClothesScraperService.scrape_clothes(url)
men_products_tshirts.first(10).each do |tshirt|
  begin
    if Product.find_by(name: tshirt[:name])
      p "Product already seeded"
      next
    end
    file = URI.open(tshirt[:image])
    product = Product.new(tshirt)
    product.product_type = "top"
    product.season = "summer, spring"
    product.style = "casual"
    product.gender = "male"
    product.save!
    product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
    unless product.photo.attached?
      puts "Skipping #{product.name} - image attachment failed."
      product.destroy
      next
    end
    product.description = product.generate_description
    rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
      # Handle network/image fetching errors
      puts "Skipping - Image is not accessible."
      product.destroy if product && product.persisted?
      next
    end
  product.save!
  p "#{product.name} has been created"
end


# url = "https://www.farfetch.com/shopping/men/sweaters-knitwear-2/items.aspx"
url = "https://www.farfetch.com/shopping/men/sweaters-knitwear-2/items.aspx?sort=4"
men_products_sweaters = ClothesScraperService.scrape_clothes(url)
men_products_sweaters.first(10).each do |sweater|
  begin
    if Product.find_by(name: sweater[:name])
      p "Product already seeded"
      next
    end
    file = URI.open(sweater[:image])
    product = Product.new(sweater)
    product.product_type = "top"
    product.season = "fall, winter"
    product.style = "casual"
    product.gender = "male"
    product.save!
    product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
    unless product.photo.attached?
      puts "Skipping #{product.name} - image attachment failed."
      product.destroy
      next
    end
    product.description = product.generate_description
    rescue OpenURI::HTTPError, Net::OpenTimeout, Net::ReadTimeout => e
      # Handle network/image fetching errors
      puts "Skipping - Image is not accessible."
      product.destroy if product && product.persisted?
      next
    end
product.save!
p "#{product.name} has been created"
end




# # Now, assign products to users' closet items and outfits

User.all.each do |user|
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
