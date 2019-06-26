require 'rails_helper'

RSpec.describe "Songs Index" do
  describe "As a Visitor" do
    it "I see all songs and their title and playcount" do
      artist_1 = Artist.create!(name: "Britney Spears")
      artist_2 = Artist.create!(name: "Haddaway")
      song_1 = artist_1.songs.create!(title: "Hit Me Baby One More Time", length: 345, play_count: 1000000)
      song_2 = Song.create!(title: "What is Love", length: 543, play_count: 2, artist_id: artist_2.id)

      visit "/songs"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("Playcount: #{song_1.play_count}")
      expect(page).to have_content(song_2.title)
      expect(page).to have_content("Playcount: #{song_2.play_count}")
    end
  end
end
