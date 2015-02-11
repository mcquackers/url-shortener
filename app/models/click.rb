class Click < ActiveRecord::Base
  belongs_to :link
  belongs_to :info_record, foreign_key: :link_id
end
