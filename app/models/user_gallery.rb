class UserGallery < ActiveRecord::Base
	belongs_to :user

	has_attached_file :preview_image, 
	                  :styles => { :original => "300x300#" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :name,          presence: true
	validates :preview_image, :attachment_presence => true
end
