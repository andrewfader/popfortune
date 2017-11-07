require "selenium-webdriver"
require 'csv'
class SpotifyChart
  class << self
    def process_date(date, driver=nil)
      processed = {artists: 0, songs: 0, days:0}
      date = date.strftime('%Y-%m-%d')
      filename = "/home/andrew/Downloads/regional-global-daily-#{date}.csv"
      driver ||= Selenium::WebDriver.for :chrome
      unless File.exist?(filename)
        url =  "https://spotifycharts.com/regional/global/daily/#{date}/download"
        driver.navigate.to url
      end

      if !File.exist?(filename)
        sleep 1
      end

      CSV.parse(File.open(filename)) do |row|
        next if row[1] == "Track Name"
        title = row[1]
        artist = row[2]
        streams = row[3]

        count = Artist.count
        artist = Artist.find_or_create_by!(name: artist)
        processed[:artists] += 1 if Artist.count > count

        count = Song.count
        song = Song.find_or_create_by!(title: title, artist: artist)
        processed[:songs] += 1 if Song.count > count

        count = Day.count
        day = Day.find_or_create_by!(date: date, song: song, streams: streams)
        processed[:days] += 1 if Day.count > count

        puts "Processed #{title} by #{artist}"
      end
      puts processed
      processed
    end

    def process_range(date1, date2)
      processed = []
      driver = Selenium::WebDriver.for :chrome
      begin
        (date1.to_date..date2.to_date).to_a.each do |date|
          processed << self.process_date(date, driver)
        end
      rescue Errno::ENOENT => e
        driver.quit
      end
      processed.inject do |item,total|
        item.keys.each do |key|
          total[key] += item[key]
        end
        total
      end
    end

    def fetch_week(num=7)
      process_range(num.days.ago.to_date, Date.today.to_date)
    end

  end
end
