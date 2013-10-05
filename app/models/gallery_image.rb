class GalleryImage < ActiveRecord::Base
	belongs_to :gallery

  has_attached_file :image, 
	                  :styles => { :original => "3000x3000>",
	                               :large => "600x600>",
	                               :small => "300x300>",
	                               :thumb => "150x150>" }, 
	                  :default_url => "/images/:style/missing.png"

	validates_attachment :image,
	                     :presence => true,
                       :content_type => { :content_type => ['image/jpeg'] }
end
