class AddDescAndImgToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :description, :string
  	add_attachment :posts, :cover_image
  end
end
