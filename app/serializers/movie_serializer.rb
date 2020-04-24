class MovieSerializer < ActiveModel::Serializer
  attributes :imdb_id, :title, :overview, :production_companies, :release_date, :budget, :language, :genres, :runtime, :average_rating, :rotten_tomatoes_rating

  def budget
    "$#{object.budget.to_s}"
  end

  def rotten_tomatoes_rating
    default_message = "No rotten tomatoes score"
    return default_message unless object.imdb_id
    response = OmdbService.get_by_imdb_id(object.imdb_id)
    rotten_tomato_rating = response["Ratings"].find { |rating| rating["Source"] == "Rotten Tomatoes" }
    rotten_tomato_rating.nil? ? default_message : rotten_tomato_rating["Value"] 
  end
end