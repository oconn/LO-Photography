class CreateUserGalleries < ActiveRecord::Migration
  def change
    create_table :user_galleries do |t|
    	t.string :name
    	t.text :description
    	t.attachment :preview_image
    	t.integer :user_id

      t.timestamps
    end

    add_index :user_galleries, :user_id
  end
end
