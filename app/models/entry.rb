class Entry < ActiveRecord::Base
  #attr_accessible :title, :year, :nfo, :media_typ, :quality, :links, :links_attributes
  has_many :links, :dependent => :destroy
  has_many :categorizations,:dependent => :destroy
  has_many :genres, :through => :categorizations

  accepts_nested_attributes_for :links, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true
  validates_presence_of :title, :quality, :media_typ

  validates :year,
            :presence => true,
            :numericality => { :only_integer => true },
            :length => { :is => 4 }

  QUALITIES=%w[720p 1080p DVD lowRes]

  def quality_symbols
    [quality.to_sym]
  end

end

