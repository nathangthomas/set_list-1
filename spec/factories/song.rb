FactoryBot.define do
  factory :song do
    sequence(:title) { |n| "Title #{n}"}
    # title { "this is a song" }
    # play_count { 0 }
    sequence(:play_count) { |n| n }
    length { 456 }
    artist
  end
end
