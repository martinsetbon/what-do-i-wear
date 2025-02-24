# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"
Product.destroy_all
Product.create!([
  # tops
  {
    name: "Womens Cotton Relaxed Shirt",
    price: 3990.00,
    product_type: "top",
    image: "https://image.uniqlo.com/UQ/ST3/ph/imagesgoods/470129/item/phgoods_09_470129_3x4.jpg?width=494",
    url: "https://www.uniqlo.com/jp/en/products/E465654-000/00?colorDisplayCode=69"
  },
  {
    name: "Zara Satin Draped Blouse",
    price: 5990.00,
    product_type: "top",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkCTADUXVWuA-TkQ-OQs-AYNHH7U9CMxe5hA&s",
    url: "https://www.zara.com/jp/en/satin-draped-blouse-p08502712.html"
  },
  {
    name: "H&M Oversized Linen Shirt",
    price: 4999.00,
    product_type: "top",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuEJTcO1IWPPCaHQWx7fqRLxg2dFQo8C2OA&s",
    url: "https://www2.hm.com/en_jp/productpage.1112101001.html"
  },

  # bottoms
  {
    name: "Zara High-Waisted Wide-Leg Pants",
    price: 7990.00,
    product_type: "bottom",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWH-_VwO-FO3JZ6Fy3nPWYbELaSjfn57Tmgw&s",
    url: "https://www.zara.com/jp/en/high-waist-wide-leg-pants-p25891243.html"
  },
  {
    name: "Uniqlo Smart Ankle Pants",
    price: 3990.00,
    product_type: "bottom",
    image: "https://api.fastretailing.com/ugc/v1/uq/my/SR_IMAGES/ugc_stylehint_uq_my_photo_230428_1085278_c-600-800",
    url: "https://www.uniqlo.com/jp/en/products/E453712-000/00?colorDisplayCode=69"
  },
  {
    name: "H&M Satin Midi Skirt",
    price: 5499.00,
    product_type: "bottom",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS95mYcpkx27bGZRust-fRyJyTXhIwO5gP_8g&s",
    url: "https://www2.hm.com/en_jp/productpage.1108349001.html"
  },

  # Shoes
  {
    name: "Nike Air Force 1 07",
    price: 13200.00,
    product_type: "shoes",
    image: "https://static.nike.com/a/images/t_PDP_936_v1/f_auto,q_auto:eco/cf803777-bca4-437c-b00e-6f8abe18bbb4/AIR+FORCE+1+%2707+LV8.png",
    url: "https://www.nike.com/jp/t/air-force-1-07-shoes-Dz225t"
  },

  {
    name: "Zara Leather Loafers",
    price: 9990.00,
    product_type: "shoes",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKamdYjN-lhYHul8lmRun-SNLQFXE3tzgJQw&s",
    url: "https://www.zara.com/jp/en/leather-loafers-p1603820"
  },
  {
    name: "H&M Strappy Sandals",
    price: 3999.00,
    product_type: "shoes",
    image: "https://lp2.hm.com/hmgoepprod?set=quality%255B79%255D%252Csource%255B%252Fed%252Fe5%252Fede5d9b5c2e77a1fbe17a092f1ad512f2f5dc519.jpg%255D%252Corigin%255Bdam%255D%252Ccategory%255B%255D%252Ctype%255BDESCRIPTIVESTILLLIFE%255D%252Cres%255Bm%255D%252Chmver%255B2%255D&call=url%5Bfile:/product/main%5D",
    url: "https://www2.hm.com/en_jp/productpage.1102339002.html"
  }
])
puts "seeds created"
