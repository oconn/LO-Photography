class UserGallery < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => [:slugged]

	belongs_to :user
	has_many :user_images, dependent: :destroy

	has_attached_file :preview_image, 
	                  :styles => { :original => "300x300#" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :name,          presence: true
	validates :preview_image, :attachment_presence => true

	def should_generate_new_friendly_id?
    name_changed?
  end
end
