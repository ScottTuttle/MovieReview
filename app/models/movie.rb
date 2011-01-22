class Movie < ActiveRecord::Base
  has_many :comments
  
  GENRES = ['Horror', 'Sci-Fi', 'Action', 'Fantasy']
  
  validates :title, :presence => true
  validates :director, :presence => true
  validates :starring, :presence => true
  validates :genre, :inclusion => { :in => GENRES, :message => 'must be selected' }
end
