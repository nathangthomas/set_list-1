class ArtistsController < ApplicationController
  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    artist = Artist.new(artist_params)
    artist.save
    redirect_to "/artists/#{artist.id}"
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
