class Speech < ActiveRecord::Base
  belongs_to :entry, :touch => true
  belongs_to :language
end

