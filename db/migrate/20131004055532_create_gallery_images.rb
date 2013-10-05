class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
    	t.attachment :image
      t.integer :gallery_id

      t.timestamps
    end
    add_index :gallery_images, :gallery_id
  end
end
