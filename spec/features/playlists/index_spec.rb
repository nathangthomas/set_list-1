require 'rails_helper'

RSpec.describe "Playlist Index Page" do
  it "shows all the playlists and their songs" do
    talking_heads = Artist.create!(name: "Talking Heads")
    janet_jackson = Artist.create!(name: "Janet Jackson")
    place = talking_heads.songs.create!(title: "This Must Be The Place", play_count: 5743, length: 543)
    she_was = talking_heads.songs.create!(title: "And She Was", play_count: 7654, length: 400)
    party = Playlist.create!(name: "Party!")
    party.songs << place

    jams = she_was.playlists.create!(name: "Fav Jams")
    nasty = jams.songs.create!(title: "Nasty", play_count: 74893, length: 526, artist: janet_jackson)
    PlaylistSong.create(song: place, playlist: jams)
    if_song = jams.songs.create!(title: "IF", play_count: 75843, length: 854, artist: janet_jackson)

    party.songs << nasty

    visit playlists_path

    within("#playlist-#{jams.id}") do
      expect(page).to have_content(jams.name)
      expect(page).to have_content(she_was.title)
      expect(page).to have_content(nasty.title)
      expect(page).to have_content(if_song.title)
      expect(page).to have_content(place.title)
    end

    within("#playlist-#{party.id}") do
      expect(page).to have_content(party.name)
      expect(page).to have_content(nasty.title)
      expect(page).to have_content(place.title)
    end
  end
end
