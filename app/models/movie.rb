class Movie < ApplicationRecord
  validates_presence_of :title,:genre,:plot,:rating,:web
end
