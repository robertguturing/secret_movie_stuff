class Movie < ApplicationRecord
  validates_presence_of(:imdb_id)
  validates_presence_of(:title)
end
