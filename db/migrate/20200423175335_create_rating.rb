class CreateRating < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false
      t.float :rating, null: false
      t.timestamps
    end
  end
end
