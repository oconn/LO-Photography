class AddFriendlyIdToPost < ActiveRecord::Migration
  def change
  	add_column :user_galleries, :slug, :string
    add_index :user_galleries, :slug, unique: true
  end
end
