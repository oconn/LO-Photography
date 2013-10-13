class CreateUserImages < ActiveRecord::Migration
  def change
    create_table :user_images do |t|
      t.string :user_id
      t.string :user_gallery_id
      t.attachment :image


      t.timestamps
    end

    add_index :user_images, :user_gallery_id
  end
end
