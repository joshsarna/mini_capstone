class CreateApiPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :api_pictures do |t|
      t.string :url
      t.integer :product_id

      t.timestamps
    end
  end
end
