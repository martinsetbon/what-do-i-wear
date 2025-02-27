class UpdateGenderInOutfits < ActiveRecord::Migration[7.1]
  def change
       change_column_default :outfits, :gender, from: 'androgynous', to: 'unisex'
  end
end
