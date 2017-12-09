class Movie < ApplicationRecord
  mount_uploader :image, MovieUploader
  has_many :views, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users,through: :comments
  validates_presence_of :title,:genre,:plot,:image,:rating,:web
end
