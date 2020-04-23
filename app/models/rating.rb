class Rating < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :rating
  validates_presence_of :movie_id 
  validates_uniqueness_of :movie_id, scope: :user_id

  belongs_to :movie
end
