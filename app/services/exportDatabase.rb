require "json"

class ExportDatabase
  def self.export
    products = Product.all.map(&:attributes).map do |product_hash|
      product_hash.delete("created_at")
      product_hash.delete("updated_at")
      product_hash.delete("id")
      product_hash
    end

    filepath = "#{Rails.root}/db/products.json"

    serialized_products = File.read(filepath)

    data = JSON.parse(serialized_products) unless serialized_products.empty?

    data = { "products" => [] } if data.nil? || data.empty?

    data["products"] += products
    data["products"] = data["products"].uniq { |attributes| attributes["name"] }

    File.open(filepath, "wb") do |file|
      file.write(JSON.generate(data))
    end
  end
end
