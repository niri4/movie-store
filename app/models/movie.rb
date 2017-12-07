class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  has_many :views
  has_many :comments
  has_many :users,through: :comments
  validates_presence_of :title,:genre,:plot,:image,:rating,:web
end
