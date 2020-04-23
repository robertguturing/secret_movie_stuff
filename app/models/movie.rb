class Movie < ApplicationRecord
  validates_presence_of(:imdb_id)
  validates_presence_of(:title)

  has_many :ratings, dependent: :destroy

  def average_rating
    ratings.average(:rating).to_f
  end
end
