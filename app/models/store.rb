class Store < ActiveRecord::Base
  has_many :media
  validates :username, uniqueness: true
end
