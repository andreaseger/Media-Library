class Link < ActiveRecord::Base
  attr_accessible :entry_id, :name, :url
  belongs_to :entry
  validates_presence_of :url, :name
  #validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
end

