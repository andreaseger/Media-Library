class Entry < ActiveRecord::Base
  attr_accessible :title, :year, :imdb, :nfo, :media_typ, :quality
  has_many :links
  has_many :categorizations
  has_many :genres, :though => :categorizations

  QUALITIES=%w[720p 1080p DVD lowRes]

  def quality_symbols
    [quality.to_sym]
  end

end

