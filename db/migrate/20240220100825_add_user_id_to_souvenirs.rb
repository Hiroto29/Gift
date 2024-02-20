class AddUserIdToSouvenirs < ActiveRecord::Migration[6.1]
  def change
    add_column :souvenirs, :user_id, :integer
  end
end
