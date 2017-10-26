require 'rss'
class Hot100
  attr_accessor :feed

  def initialize
    @feed = self.class.rss_feed
  end

  def self.rss_feed
    RSS::Parser.parse("http://www.billboard.com/rss/charts/hot-100")
  end

  def create_items_for_week
    @feed.items.each do |item|
      name = item.description.split(" by ")[1].split(" ranks ")[0]
      artist = Artist.find_or_create_by!(name: name)
      song = Song.find_or_create_by(title: item.title, artist: artist)
    end

  end

end
