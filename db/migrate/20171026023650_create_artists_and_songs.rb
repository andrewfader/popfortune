class CreateArtistsAndSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :mb_id
      t.integer :spotify_id
      t.string :label
      t.timestamps
    end

    create_table :songs do |t|
      t.string :title
      t.date :year
      t.date :first_week
      t.integer :mb_id
      t.integer :spotify_id
      t.belongs_to :artist
      t.string :label
      t.timestamps
    end

    create_table :weeks do |t|
      t.integer :position
      t.belongs_to :song
      t.timestamps
    end
  end
end
