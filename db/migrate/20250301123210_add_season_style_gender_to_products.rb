class AddSeasonStyleGenderToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :season, :string
    add_column :products, :style, :string
    add_column :products, :gender, :string
  end
end
