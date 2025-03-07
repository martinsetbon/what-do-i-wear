class OutfitProduct < ApplicationRecord
  belongs_to :outfit
  belongs_to :product
  scope :top, -> { joins(:product).where(products:{product_type: "top"})}
  scope :bottom, -> { joins(:product).where(products:{product_type: "bottom"})}
  scope :shoes, -> { joins(:product).where(products:{product_type: "shoes"})}
end
