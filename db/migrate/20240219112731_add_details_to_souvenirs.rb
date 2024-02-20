class AddDetailsToSouvenirs < ActiveRecord::Migration[6.1]
  def change
    add_column :souvenirs, :lat, :float
    add_column :souvenirs, :lng, :float
  end
end
