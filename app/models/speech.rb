class Speech < ActiveRecord::Base
  belongs_to :entry
  belongs_to :language
end

