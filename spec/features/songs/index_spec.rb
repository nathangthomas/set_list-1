require 'rails_helper'

RSpec.describe "songs index page", type: :feature do
  # I see each songs title and play count
  before :each do
    @song_1 = Song.create(title: "Don't stop belivin'", length: 303, play_count: 12345)
    @song_2 = Song.create(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)
  end

  describe "statistics" do

  end

  # As a user,
  # when I visit '/songs'


  it "shows all songs" do
    visit '/songs'

    expect(page).to have_content(@song_1.title)
    expect(page).to have_content("Play Count: #{@song_1.play_count}")
    expect(page).to have_content(@song_2.title)
    expect(page).to have_content("Play Count: #{@song_2.play_count}")
  end

  it "shows the average" do

  end
end
