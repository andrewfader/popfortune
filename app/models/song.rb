class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :weeks
  has_many :days
end
