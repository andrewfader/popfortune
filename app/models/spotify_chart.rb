require "selenium-webdriver"
require 'csv'
class SpotifyChart
  def self.process_date(date, filename)
    CSV.parse(File.open(filename)) do |row|
      next if row[1] == "Track Name"
      title = row[1]
      artist = row[2]
      streams = row[3]
      artist = Artist.find_or_create_by!(name: artist)
      song = Song.find_or_create_by!(title: title, artist: artist)
      day = Day.create!(date: date, song: song, streams: streams)
      puts "Processed #{title} by #{artist}"
    end
  end

  def self.process_range(date1, date2)
    driver = Selenium::WebDriver.for :chrome
    (date1..date2).to_a.each do |date|
      date = date.strftime('%Y-%m-%d')
      filename = "/home/andrew/Downloads/regional-global-daily-#{date}.csv"
      unless File.exist?(filename)
        url =  "https://spotifycharts.com/regional/global/daily/#{date}/download"
        driver.navigate.to url
      end
      self.process_date(date, filename)
    end
    driver.quit
  end
end
