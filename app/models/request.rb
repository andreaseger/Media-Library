class Request < ActiveRecord::Base
  attr_accessible :title, :supplicant, :year, :language, :comment

  validates_presence_of :title, :supplicant
  validates :year,
          :presence => true,
          :numericality => { :only_integer => true },
          :length => { :is => 4 }
end

