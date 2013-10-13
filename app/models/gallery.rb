class Gallery < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => [:slugged]

	has_many :gallery_images, dependent: :destroy
	has_attached_file :preview_image, 
	                  :styles => { :original => "750x350>" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :name,          presence: true
	validates :preview_image, :attachment_presence => true

	def should_generate_new_friendly_id?
    name_changed?
  end
end
