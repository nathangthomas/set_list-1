class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    song = Song.find_by(title: song_params[:songs])
    playlist = Playlist.new(playlist_params)
    playlist.songs << song
    playlist.save
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def song_params
    params.require(:playlist).permit(:songs)
  end
end
