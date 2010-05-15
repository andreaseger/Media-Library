class Link < ActiveRecord::Base
  attr_accessible :entry_id, :name, :url
  belongs_to :entry
  validates :url,
            :presence => true,
            :url_format => true
  validates_presence_of :name
end

