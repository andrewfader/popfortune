class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
    if d = params[:d]
      if (0..300).include? d.to_i
        @prices = @song.prices(d.to_i)
      end
    else
      @prices = @song.prices
    end
  end

  def index; end
end
