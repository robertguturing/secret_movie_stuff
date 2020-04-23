require 'rails_helper'

RSpec.describe Rating, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:rating) }
    it 'should not let the same user rate a movie twice' do
      movie = Movie.create(title: 'Alive', imdb_id: 'abc123')
      Rating.create(user_id: 1, movie_id: movie.id, rating: 5.0)
      rating = Rating.new(user_id: 1, movie_id: movie.id, rating: 2.5)
      expect(rating).not_to be_valid
    end
  end

  describe 'relationships' do
    it { should belong_to(:movie) }
  end
end
