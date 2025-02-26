# require "open-uri"

# # Destroy existing records to avoid duplication
# OutfitProduct.destroy_all
# puts "Outfit products deleted"
# Outfit.destroy_all
# puts "Outfits deleted"
# Product.destroy_all
# puts "Products deleted"
# ClosetItem.destroy_all
# puts "Closet items deleted"
# User.destroy_all
# puts "Users deleted"

# # Create some users
# users = User.create!([
#   { email: 'user1@example.com', password: 'password123' },
#   { email: 'user2@example.com', password: 'password123' },
#   { email: 'user3@example.com', password: 'password123' }
# ])
# puts "Users created"

# # Create products
# products = Product.create!([
#   # tops
#   {
#     name: "Womens Cotton Relaxed Shirt",
#     price: 3990.00,
#     product_type: "top",
#     image: "https://image.uniqlo.com/UQ/ST3/ph/imagesgoods/470129/item/phgoods_09_470129_3x4.jpg?width=494",
#     url: "https://www.uniqlo.com/jp/en/products/E465654-000/00?colorDisplayCode=69"
#   },
#   {
#     name: "Zara Satin Draped Blouse",
#     price: 5990.00,
#     product_type: "top",
#     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkCTADUXVWuA-TkQ-OQs-AYNHH7U9CMxe5hA&s",
#     url: "https://www.zara.com/jp/en/satin-draped-blouse-p08502712.html"
#   },
#   {
#     name: "H&M Oversized Linen Shirt",
#     price: 4999.00,
#     product_type: "top",
#     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuEJTcO1IWPPCaHQWx7fqRLxg2dFQo8C2OA&s",
#     url: "https://www2.hm.com/en_jp/productpage.1112101001.html"
#   },

#   # bottoms
#   {
#     name: "Zara High-Waisted Wide-Leg Pants",
#     price: 7990.00,
#     product_type: "bottom",
#     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWH-_VwO-FO3JZ6Fy3nPWYbELaSjfn57Tmgw&s",
#     url: "https://www.zara.com/jp/en/high-waist-wide-leg-pants-p25891243.html"
#   },
#   {
#     name: "Uniqlo Smart Ankle Pants",
#     price: 3990.00,
#     product_type: "bottom",
#     image: "https://api.fastretailing.com/ugc/v1/uq/my/SR_IMAGES/ugc_stylehint_uq_my_photo_230428_1085278_c-600-800",
#     url: "https://www.uniqlo.com/jp/en/products/E453712-000/00?colorDisplayCode=69"
#   },
#   {
#     name: "H&M Satin Midi Skirt",
#     price: 5499.00,
#     product_type: "bottom",
#     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS95mYcpkx27bGZRust-fRyJyTXhIwO5gP_8g&s",
#     url: "https://www2.hm.com/en_jp/productpage.1108349001.html"
#   },

#   # shoes
#   {
#     name: "Nike Air Force 1 07",
#     price: 13200.00,
#     product_type: "shoes",
#     image: "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/cf803777-bca4-437c-b00e-6f8abe18bbb4/AIR+FORCE+1+%2707+LV8.png",
#     url: "https://www.nike.com/jp/t/air-force-1-07-shoes-Dz225t"
#   },

#   {
#     name: "Zara Leather Loafers",
#     price: 9990.00,
#     product_type: "shoes",
#     image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKamdYjN-lhYHul8lmRun-SNLQFXE3tzgJQw&s",
#     url: "https://www.zara.com/jp/en/leather-loafers-p1603820"
#   },
#   {
#     name: "H&M Strappy Sandals",
#     price: 3999.00,
#     product_type: "shoes",
#     image: "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/6e862b7937c99445e5e1d307966b88f933f655f4_xxl-1.jpg",
#     url: "https://www2.hm.com/en_jp/productpage.1102339002.html"
#   }
# ])
# puts "Products created"

# # Now, assign products to users' closet items and outfits

# users.each do |user|
#   # Closet items: 1 random item from each type
#   %w(top bottom shoes).each do |type|
#     product = Product.where(product_type: type).sample
#     ClosetItem.create!(user: user, product: product)
#   end

#   # Create outfits for each user
#   2.times do  # Create 2 outfits per user
#     outfit = Outfit.create!(
#       user: user,
#       name: Faker::Lorem.words(number: 2).join(' '),
#       budget: rand(1000..5000),
#       season: %w(summer fall winter spring).sample,
#       style: %w(casual formal).sample,
#       gender: %w(male female unisex).sample
#     )

#     # Add 1 random product per type to the outfit
#     %w(top bottom shoes).each do |type|
#       product = Product.where(product_type: type).sample
#       OutfitProduct.create!(outfit: outfit, product: product)
#     end
#   end
# end


# puts "Seeds created successfully"


url = "https://www.farfetch.com/jp/shopping/men/polo-shirts-2/items.aspx"
products_top = ClothesScraperService.scrape_clothes(url)

products_top.each do |top|
product = Product.new(top)
product.product_type = "top"
product.save!
p "#{product.name} has been created"
end
