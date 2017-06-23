class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :recorded_in, null: false
      t.string :title, null: false
      t.timestamps
    end

    add_index :albums, :band_id, unique: true
  end
end
