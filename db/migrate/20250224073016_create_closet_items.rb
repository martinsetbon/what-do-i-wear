class CreateClosetItems < ActiveRecord::Migration[7.1]
  def change
    create_table :closet_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
