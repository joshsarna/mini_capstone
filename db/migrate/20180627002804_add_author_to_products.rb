class AddAuthorToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :author, :string
  end
end
