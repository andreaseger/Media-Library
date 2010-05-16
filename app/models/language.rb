class Language < ActiveRecord::Base
  attr_accessible :long, :short
  has_many :speeches
  has_many :entries, :through => :speeches
end

