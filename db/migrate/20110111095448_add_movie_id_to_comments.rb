class AddMovieIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :movie_id, :integer
  end

  def self.down
    remove_column :comments, :movie_id
  end
end
