class Store < ActiveRecord::Base
  validates :username, uniqueness: true
end
