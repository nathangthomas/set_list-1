require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
  before :each do
    @artist = create(:artist)
    @song_1, @song_2, @song_3 = create_list(:song, 3, artist: @artist)
  end

  it "shows all songs" do
    artist = Artist.create!(name: '1903')
    song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
    song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

    binding.pry

    # visit '/songs'
    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Play Count: #{song_1.play_count}")
    expect(page).to have_content(song_2.title)
    expect(page).to have_content("Play Count: #{song_2.play_count}")
  end

  it 'has links to song show pages' do
    artist = Artist.create!(name: '1903')
    song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
    song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

    visit songs_path

    expect(page).to have_link(song_1.title)

    click_link song_1.title

    expect(current_path).to eq(song_path(song_1))
    expect(page).to have_content(song_1.title)
  end

  it 'shows song information grouped by song' do
    artist = Artist.create!(name: '1903')
    song_1 = artist.songs.create(title: 'Testing', length: 90, play_count: 1)
    song_2 = artist.songs.create(title: 'Testing', length: 90, play_count: 10)

    visit '/songs'

    within("#song-#{song_1.id}") do
      expect(page).to have_link(song_1.title)
      expect(page).to have_content("Play Count: #{song_1.play_count}")
      expect(page).to have_content("Length: #{song_1.length}")
    end

    within("#song-#{song_2.id}") do
      expect(page).to have_link(song_2.title)
      expect(page).to have_content("Play Count: #{song_2.play_count}")
      expect(page).to have_content("Length: #{song_2.length}")
    end

    within("#song-#{song_1.id}") do
      click_link(song_1.title)
    end

    expect(current_path).to eq("/songs/#{song_1.id}")
  end
end
