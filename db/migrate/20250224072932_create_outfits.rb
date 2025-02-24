class CreateOutfits < ActiveRecord::Migration[7.1]
  def change
    create_table :outfits do |t|
      t.string :name
      t.decimal :budget
      t.string :season
      t.string :style
      t.string :gender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
