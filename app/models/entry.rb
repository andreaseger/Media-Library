class Entry < ActiveRecord::Base
  attr_accessible :title, :supplicant, :year, :nfo, :media_typ, :quality
  attr_accessible :links, :links_attributes, :genre_ids, :genres, :language_ids, :languages
  attr_accessible :sub_language_ids, :sub_languages, :languages_attributes, :sub_languages_attributes
  attr_accessible :image_url

  has_many :links, :dependent => :destroy

  has_many :categorizations,:dependent => :destroy
  has_many :genres, :through => :categorizations

  has_many :speeches, :dependent => :destroy
  has_many :languages, :through => :speeches

  has_many :subtitles, :dependent => :destroy
  has_many :sub_languages, :source => :language, :through => :subtitles

  accepts_nested_attributes_for :links, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :languages, :reject_if => lambda { |a| a[:long].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :sub_languages, :reject_if => lambda { |a| a[:long].blank? }, :allow_destroy => true

  validates_presence_of :title, :quality, :media_typ
  validates :year,
            :presence => true,
            :numericality => { :only_integer => true },
            :length => { :is => 4 }
  validates :image_url,
            :url_format => true,
            :image => true
  QUALITIES=%w[720p 1080p DVD lowRes]
  MEDIATYPES=%w[Movie TV-Show Doku]

  def quality_symbols
    [quality.to_sym]
  end

  def mediatyp_symbols
    [media_typ.to_sym]
  end

  def self.search(search, page)
    paginate :per_page => 20, :page => page,
             :conditions => ['title like ?', "%#{search}%"], :order => 'title'
  end
end

