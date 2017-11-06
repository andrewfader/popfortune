module SongHelper
  def last_move(song)
    formatted = number_to_currency(song.change)
    if song.change > 0
      formatted = "+#{formatted}"
    end
    formatted
  end
end
