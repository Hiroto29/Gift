class AddImageToSouvenirs < ActiveRecord::Migration[6.1]
  def change
    add_column :souvenirs, :image, :string
  end
end
