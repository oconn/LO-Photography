class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	acts_as_taggable

	has_attached_file :cover_image, 
	                  :styles => { :original => "900x400>" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :title,       presence: true
	validates :description, presence: true
	validates :cover_image, :attachment_presence => true
  validates :tag_list,    presence: true
end
