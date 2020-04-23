require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET index" do
    
    let!(:movie1) do
      Movie.create(imdb_id: 'abc123', title: 'The Good, the Bad, and the Ugly', budget: 1_000_000,
                   release_date: '1975', genres: 'Spaghetti Western')
    
                   
    end
    let!(:movie2) do
      Movie.create(imdb_id: 'lols123', title: 'Rent', budget: 525_600,
                   release_date: '1998', genres: 'Broadway Musical')
    end
    
    it 'can return all movies' do
      get :index
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body.length).to eq(2)
      expect(body.first['imdb_id']).to eq(movie1.imdb_id)
      expect(body.first['budget']).to eq("$1000000")
    end
    
    it 'can return movies using page query param' do
      stub_const("MoviesController::MOVIES_PER_PAGE", 1)
      get :index, params: { page: '2'}
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body.length).to eq(1)
      expect(body.first['imdb_id']).to eq(movie2.imdb_id)
      expect(body.first['budget']).to eq("$525600")
    end
  end

  describe "GET show" do
    let!(:movie) do
      Movie.create(imdb_id: 'abc123', title: 'The Good, the Bad, and the Ugly', budget: 1_000_000,
                   release_date: '1975', genres: 'Spaghetti Western', overview: 'Draw!', runtime: 100.0, language: 'english', production_companies: 'paramount')
    
                   
    end
    let!(:rating) do
      Rating.create(movie_id: movie.id, user_id: 1, rating: 3.0)
    end

    it 'shows details about a movie' do
      get :show, params: { id: movie.id }
      expect(response).to have_http_status(:ok)
      body = JSON.parse(response.body)
      expect(body['overview']).to eq(movie.overview)
      expect(body['runtime']).to eq(movie.runtime)
      expect(body['language']).to eq(movie.language)
      expect(body['production_companies']).to eq(movie.production_companies)
      expect(body['release_date']).to eq(movie.release_date)
      expect(body['average_rating']).to eq(3.0)
    end
  end
end