class InfoRecord < ActiveRecord::Base
  has_many :clicks, foreign_key: :link_id
end
