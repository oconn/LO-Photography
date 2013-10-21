class UserImage < ActiveRecord::Base
	belongs_to :user_gallery

	has_attached_file :image, 
	                  :styles => { :original => "9000x9000>",
	                  	           :carousel => "900x900>",
	                               :thumb => "100x100#" }

	validates_attachment :image,
	                     :presence => true,
                       :content_type => { :content_type => ['image/jpeg'] }
end
