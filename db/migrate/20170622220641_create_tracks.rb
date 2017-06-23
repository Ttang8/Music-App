class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :song, null: false
      t.integer :album_id, null: false
      t.text :lyrics, null: false
      t.string :kind_of_track, null: false
      t.timestamps
    end
    add_index :tracks, :album_id, unique: true
  end
end
