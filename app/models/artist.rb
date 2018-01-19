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
      images =  RSpotify::Artist.search(name).first.images
      if images.present?
        self.image_url = images.first["url"].tap{self.save!}
        self.save!
        super
      else
        ""
      end
    end
  end
end
