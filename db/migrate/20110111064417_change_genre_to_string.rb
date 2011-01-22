class ChangeGenreToString < ActiveRecord::Migration
  def self.up
    change_column :movies, :genre, :string
  end

  def self.down
    change_column :movies, :genre, :integer
  end
end
