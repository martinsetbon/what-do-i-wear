class AddEmbeddingToOutfits < ActiveRecord::Migration[7.1]
  def change
    add_column :outfits, :top_embedding, :vector, limit: 1536
    add_column :outfits, :bottom_embedding, :vector, limit: 1536
    add_column :outfits, :shoes_embedding, :vector, limit: 1536
  end
end
