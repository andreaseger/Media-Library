class Categorization < ActiveRecord::Base
  belongs_to :entry, :touch => true
  belongs_to :genre
end

