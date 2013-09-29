class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.string :name
    	t.string :description
    	t.attachment :preview_image

      t.timestamps
    end
  end
end
