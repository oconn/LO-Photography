class Gallery < ActiveRecord::Base
	has_attached_file :preview_image, 
	                  :styles => { :original => "750x350>" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :name,          presence: true
	validates :preview_image, :attachment_presence => true
end
