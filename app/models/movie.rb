class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :imdb, :nfo
end
