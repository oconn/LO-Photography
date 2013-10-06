class GalleryImage < ActiveRecord::Base
	belongs_to :gallery

  has_attached_file :image, 
	                  :styles => { :original => "3000x3000>",
	                               :large => "1600x1600>",
	                               :small => "800x800>",
	                               :thumb => "300x300#" }, 
	                  :default_url => "/images/:style/missing.png"

	validates_attachment :image,
	                     :presence => true,
                       :content_type => { :content_type => ['image/jpeg'] }
end
