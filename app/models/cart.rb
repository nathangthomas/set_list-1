class Cart
  attr_reader :contents

  def initialize(contents)
    if contents
      @contents = contents
      @contents.default = 0
    else
      @contents = Hash.new(0)
    end
  end

  def add_song(song_id)
    @contents[song_id.to_s] += 1
  end

  def total
    @contents.values.sum
  end

  def song_count(song_id)
    @contents[song_id.to_s]
  end
end
