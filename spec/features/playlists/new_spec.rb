require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can add a playlist' do
    artist = Artist.create(name: 'Talking Heads')
    song = artist.songs.create(title: 'This Must be the Place')

    visit new_playlist_path

    fill_in 'Name', with: 'My Playlist'
    fill_in 'Song', with: 'This Must be the Place'
    click_button 'Create Playlist'

    expect(current_path).to eq(playlists_path)
    expect(page).to have_content('My Playlist')
    expect(page).to have_content('This Must be the Place')
    expect(song.playlists.first.name).to eq('My Playlist')
  end
end
