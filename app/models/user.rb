class User < ApplicationRecord
  mount_uploader :image, UserUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :movies, through: :comments
  validates_presence_of :name

end
