class ChangeImageToAttachedImageInProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :image, :string

    # Add the new attachment for the image using ActiveStorage
    add_reference :products, :image_attachment, foreign_key: { to_table: :active_storage_attachments }, null: true
    add_reference :products, :image_blob, foreign_key: { to_table: :active_storage_blobs }, null: true
  end
end
