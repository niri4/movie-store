class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  has_many :views
  validates_presence_of :title,:genre,:plot,:image,:rating,:web
end
