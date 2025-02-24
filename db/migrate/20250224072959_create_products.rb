class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :product_type
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
