class MovieSerializer < ActiveModel::Serializer
  attributes :imdb_id, :title, :genres, :release_date, :budget

  def budget
    "$#{object.budget.to_s}"
  end
end