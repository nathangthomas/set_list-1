# As a visitor
# When I visit /songs/1 (where 1 is the id of a song in my database)
# Then I see that song's title, and artist
# And I do not see any of the other songs in my database

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a song's show page" do
    it "I see that song's title and artist" do
      artist = Artist.create!(name: '1903')
      song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
      song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

      visit "/songs/#{song_1.id}"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("By: #{song_1.artist.name}")
      expect(page).to_not have_content(song_2.title)
    end
  end
end
