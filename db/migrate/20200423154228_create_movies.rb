class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.text :imdb_id, null: false
      t.text :title, null: false
      t.text :overview
      t.text :production_companies
      t.text :release_date
      t.integer :budget
      t.integer :revenue
      t.text :language
      t.text :genres
      t.float :runtime
      t.text :status
      
      t.timestamps
    end
  end
end
