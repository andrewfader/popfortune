class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :weeks
  has_many :days

  def self.by_price
    all.select{|song| song.price > 0}.sort_by(&:price).reverse
  end

  def total_streams
    days.map(&:streams).sum
  end

  def streams_week(num=7)
    days.where("date >= '#{num.days.ago.strftime("%Y-%m-%d")}'").map(&:streams)
  end

  def price
    (streams_week.sum / 1000000.to_f).round(2)
  end

  def price_on(date)
    days.where("date <= #{date.strftime("%Y-%m-%d")} & date >= #{(date - 7.days).strftime("%Y-%m-%d")}").map(&:streams)
  end
end
