class Artist < ActiveRecord::Base
  has_many :songs
  has_many :weeks, through: :songs
  def to_s
    name
  end
end
