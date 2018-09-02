class AddMovieIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :movie_id, :integer
    add_index :reviews, :movie_id
  end
end
