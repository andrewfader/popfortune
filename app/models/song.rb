class Song < ActiveRecord::Base
  PRICE_FACTOR = 1000000
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
    (streams_week.sum / PRICE_FACTOR.to_f).round(2)
  end

  def title
    new_title = super
    if new_title.include? "(feat"
      new_title = new_title.split(" (feat")[0]
    end
    if new_title.include? "(Feat"
      new_title = new_title.split(" (Feat")[0]
    end
    if new_title.include? "(with"
      new_title = new_title.split(" (with")[0]
    end
    if new_title.include? "(Remix"
      new_title = new_title.split(" (Remix")[0]
    end
    if new_title.include? "Radio Edit"
      new_title = new_title.split(" - Radio")[0]
    end
    new_title
  end

  def price_on(date)
    (days.where(date: (date - 7.days).to_date..date).map(&:streams).sum / PRICE_FACTOR).round(2)
  end

  def up_or_down?
    price >= price_on(Date.yesterday) ?  "up" : "down"
  end

  def change
    (price - price_on(Date.yesterday)).round(4)
  end

  def pct_change
    (change/price * 100).round(2)
  end

  def prices(num=20)
    prices = {}
    (num.days.ago.to_date..Date.today.to_date).to_a.map do |date|
      prices[date] = price_on(date).round(2)
    end
    prices
  end

  def bid
    (price - 1).round(2)
  end

  def ask
    (price + 1).round(2)
  end
end
