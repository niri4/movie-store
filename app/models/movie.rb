class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  validates_presence_of :title,:genre,:plot,:image,:rating,:web
end
