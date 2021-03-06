class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_galleries, dependent: :destroy

  # TODO Fix validations
  #validates :first_name, :presence => "true"
  #validates :last_name, :presence => "true"
end
