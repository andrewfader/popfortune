class Artist < ActiveRecord::Base
  has_many :songs
  has_many :weeks, through: :songs
  def to_s
    name
  end

  def image_url
    if super
      super
    else
      self.image_url = RSpotify::Artist.search(name).first.images.first["url"].tap{self.save!}
      self.save!
      super
    end
  end
end
