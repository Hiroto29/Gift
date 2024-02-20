class CreateSouvenirs < ActiveRecord::Migration[6.1]
  def change
    create_table :souvenirs do |t|
      t.string :name
      t.string :prefecture
      t.string :adress
      t.text :about
      t.timestamps
    end
  end
end
