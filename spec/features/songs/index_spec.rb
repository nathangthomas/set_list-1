require 'rails_helper'

RSpec.describe "Songs Index" do
  describe "As a Visitor" do
    it "I see all songs and their title and playcount" do
      song_1 = Song.create(title: "Hit Me Baby One More Time", length: 345, playcount: 10000000)
      song_2 = Song.create(title: "What is Love", length: 543, playcount: 2)

      binding.pry

      visit "/songs"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("Playcount: #{song_1.playcount}")
      expect(page).to have_content(song_2.title)
      expect(page).to have_content("Playcount: #{song_2.playcount}")
    end
  end
end
