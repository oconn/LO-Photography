class GalleryImage < ActiveRecord::Base
	belongs_to :gallery

  has_attached_file :image, 
	                  :styles => { :original => "1600x1600>",
	                               :thumb => "100x100#" }, 
	                  :default_url => "/images/:style/missing.png"

	validates_attachment :image,
	                     :presence => true,
                       :content_type => { :content_type => ['image/jpeg'] }
                            
end
