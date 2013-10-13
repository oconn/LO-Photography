class AddFriendlyIdToGalleries < ActiveRecord::Migration
  def change
  	add_column :galleries, :slug, :string
    add_index :galleries, :slug, unique: true
  end
end
