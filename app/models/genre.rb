class Genre < ActiveRecord::Base
  attr_accessible :name
  has_many :categorizations
  has_many :entries, :through => :categorizations

end

