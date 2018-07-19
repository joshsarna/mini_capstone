class CreateGenreProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_products do |t|
      t.integer :product_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
