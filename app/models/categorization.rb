class Categorization < ActiveRecord::Base
  belongs_to :entry
  belongs_to :genre
end

