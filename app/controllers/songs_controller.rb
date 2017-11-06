class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def index; end
end
