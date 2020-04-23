class MovieSerializer < ActiveModel::Serializer
  attributes :imdb_id, :title, :overview, :production_companies, :release_date, :budget, :language, :genres, :runtime, :average_rating

  def budget
    "$#{object.budget.to_s}"
  end
end