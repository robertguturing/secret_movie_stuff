class OmdbService
  def self.get_by_imdb_id(imdb_id)
    HTTParty.get("http://www.omdbapi.com/?i=#{imdb_id}&apikey=be5764bd")
  end
end