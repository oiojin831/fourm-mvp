class Medium < ActiveRecord::Base
  belongs_to :store
  has_one :tag
end
