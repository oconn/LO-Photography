class Post < ActiveRecord::Base
	extend FriendlyId
	has_many :comments, dependent: :destroy
	acts_as_taggable

	has_attached_file :cover_image, 
	                  :styles => { :original => "900x400>" }, 
	                  :default_url => "/images/:style/missing.png"

	validates :title,       presence: true
	validates :description, presence: true
	validates :cover_image, :attachment_presence => true
  validates :tag_list,    presence: true
  
  friendly_id :title, :use => [:slugged]

  def self.search(search, page)
    paginate :per_page => 5, :page => page,
             :conditions => ['title ilike ? or description ilike ?', ["%#{search}%"]*2].flatten,
             :order => 'title'
  end
end
