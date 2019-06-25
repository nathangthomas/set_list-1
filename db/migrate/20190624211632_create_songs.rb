class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :play_count
      t.integer :length

      t.timestamps
    end
  end
end
