require 'nokogiri'
require 'open-uri'
require 'json'

class ClothesScraperService
  def self.scrape_clothes(url)
    # Open the URL and parse the HTML
    # response = URI.parse(url).read
    response = File.open("./tshirts.html")
    html_doc = Nokogiri::HTML.parse(response)
    json_script = html_doc.search('script[type="application/ld+json"]')

    # Get the content inside the script tag, which is the raw JSON string
    json_content = json_script.text.strip

    cleaned_json = json_content.gsub(/\\n|\\t|\\r/, "")  # Remove newlines and tabs

    # 2. Replace escaped quotes with normal quotes
    cleaned_json = cleaned_json.gsub(/\\\"/, "\"")  # Remove escaped quotes

    # 3. Remove any unwanted characters before the first '{'
    cleaned_json.gsub!(/^.*?(\{.*\})$/, '\1')  # Keep only the part starting with '{' and ending with '}'

    # 4. Remove unwanted `@` and `"` or `'` characters at the start of the string
    cleaned_json.gsub!(/^['"]?@['"]?/, '')  # Remove unwanted "@'"

    # 5. Ensure the content starts with `{` and ends with `}`
    cleaned_json.gsub!(/^.*\{/, '{')  # Remove anything before the first opening brace
    cleaned_json.gsub!(/\}.*$/, '}')  # Remove anything after the last closing brace

    p cleaned_json.strip

    # Parse the JSON string into a Ruby hash or array
    # parsed_json = JSON.parse(cleaned_json)

    # Now you have the parsed JSON data (Ruby hash or array)
    # parsed_json

    # clothes = []

    # # Search for all product elements (this is based on the assumption that
    # # Farfetch uses some class for their product tiles)

    # html_doc.search('[data-testid="product"]').each do |element|
    #   # Try to get the product name from the 'alt' attribute of the image
    #   product_name = element.search("img").first&.[]("alt")
    #   if product_name.nil? || product_name.empty?
    #     product_name = element.search(".ltr-10idii7-Body-BodyBold").text.strip
    #   end

    #   # Get product price
    #   product_price = element.search('[data-component="Price"]').text.gsub(/￥|,/,"").to_i
    #   if product_price == 0
    #     product_price = element.search('[data-component="PriceFinal"]').text.gsub(/￥|,/,"").to_i
    #   end

    #   # Get product URL (relative path)
    #   product_url = element.search("a").first["href"].strip
    #   product_url = URI.join("https://www.farfetch.com/", product_url).to_s # Make sure the URL is complete


    #   # Get product image URL
    #   product_image = element.search("img").first["src"].strip


    #   # Push the product data into the clothes array
    #   clothes << {
    #     name: product_name,
    #     price: product_price,
    #     url: product_url,
    #     image: product_image
    #   }

    # end

    # Return the scraped data
  #  clothes
  end
end

# Example usage with Farfetch URL
url = "https://www.farfetch.com/jp/shopping/men/polo-shirts-2/items.aspx"
products_top = ClothesScraperService.scrape_clothes(url)
