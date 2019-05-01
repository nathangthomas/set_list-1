Song.destroy_all
Artist.destroy_all

talking_heads = Artist.create!(name: 'Talking Heads')
she_was = talking_heads.songs.create!(title: 'And She Was', length: 234, play_count: 23)
wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 894 )

prince = Artist.create!(name: 'Prince')
raspberry_beret = prince.songs.create!(title: 'Raspberry Beret', length: 340, play_count: 434)
