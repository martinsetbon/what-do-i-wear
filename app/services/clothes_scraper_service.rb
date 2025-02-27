require 'nokogiri'
require 'open-uri'
require 'json'

class ClothesScraperService
  def self.scrape_clothes(url)
    clothes = []

    # Open the URL and parse the HTML
    response = URI.parse(url).read

    # TODO: Remove this line and the associated tshirts.html
    # response = File.open("./tshirts.html")

    html_doc = Nokogiri::HTML.parse(response)

    # This will look for the script tag with the itemListElement json. There are two on the page but only want the first one so we use [0]
    json_script = html_doc.search('script[type="application/ld+json"]')[0]

    # Get the content inside the script tag, which is the raw JSON string
    json_content = json_script.text

    # We clean the json contest removing any new lines, white spaces or @'s
    cleaned_json = json_content.gsub(/\n\s+|@/, "")

    # We then parse the cleaned json creating a friendly json we can now parse
    parsed_json = JSON.parse(cleaned_json)

    number_of_items =  parsed_json["numberOfItems"]
    p "json holds #{number_of_items} items"

    # We then iterate through the itemListElement creating nice hashes and storing them into the clothes array
    parsed_json["itemListElement"].each do |item|
      clothes << {
        name: "#{item["brand"]["name"]} - #{item["name"]}",
        price: item["offers"]["price"],
        url: item["offers"]["url"],
        image: item["image"][0]
      }
    end

    clothes
  end
end

# Example usage with Farfetch URL
# url = "https://www.farfetch.com/shopping/men/shoes-2/items.aspx"
# products_shoes = ClothesScraperService.scrape_clothes(url)

# p products_shoes
