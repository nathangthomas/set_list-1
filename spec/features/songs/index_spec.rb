require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
  it "shows all songs" do
    artist = Artist.create!(name: '1903')
    song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
    song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

    visit '/songs'

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it 'has links to song show pages' do
    artist = Artist.create!(name: '1903')
    song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
    song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

    visit '/songs'

    expect(page).to have_link(song_1.title)

    click_link song_1.title

    expect(current_path).to eq("/songs/#{song_1.id}")
    expect(page).to have_content(song_1.title)
  end
end
