class ChangePriceInProducts < ActiveRecord::Migration[7.1]
  def up
    change_column :products, :price, :decimal, precision: 10, scale: 2
  end

  def down
    change_column :products, :price, :integer # Change this to the previous type
  end
end
