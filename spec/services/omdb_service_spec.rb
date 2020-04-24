require 'rails_helper'

RSpec.describe OmdbService do
  # we want to fetch rotten tomatoes score form the omdb service using
  # imdb_id attribute on the Movie model

  describe '.get_by_imdb_id' do
    it 'should return guardians of the galaxy' do
    imdb_id = 'tt3896198'
    result = described_class.get_by_imdb_id(imdb_id)
    body = JSON.parse(result.body)
    expect(body['Title']).to eq("Guardians of the Galaxy Vol. 2")
    end
  end
end