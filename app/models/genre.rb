class Genre < ActiveRecord::Base
  attr_accessible :name
  has_many :entries
end

