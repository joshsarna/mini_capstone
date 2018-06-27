class AddFormatToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :format, :string
  end
end
