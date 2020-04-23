require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:imdb_id) }
    it { should validate_presence_of(:title) }
  end

  describe 'relationships' do
    it { should have_many(:ratings) }
  end

  describe '#average_rating' do
    let!(:movie) { Movie.create(title: 'A Quiet Place', imdb_id: 'abc123')}
    context 'there are ratings for a movie' do  
      let!(:bad_rating) { Rating.create(user_id: 2, movie_id: movie.id, rating: 1.0)}
      let!(:great_rating) { Rating.create(user_id: 1, movie_id: movie.id, rating: 5.0)}
      it { expect(movie.average_rating).to eq(3.0) }
    end
    context 'no ratings for a movie' do
      it { expect(movie.average_rating).to eq(0.0) }
    end
  end
end
