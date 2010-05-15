class Link < ActiveRecord::Base
  attr_accessible :entry_id, :name, :url
  belongs_to :entry
end

