class UserGallery < ActiveRecord::Base
	extend FriendlyId
	belongs_to :user
	friendly_id :name, :use => [:slugged]

	has_attached_file :preview_image, 
	                  :styles => { :original => "300x300#" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :name,          presence: true
	validates :preview_image, :attachment_presence => true

	def should_generate_new_friendly_id?
    name_changed?
  end
end
