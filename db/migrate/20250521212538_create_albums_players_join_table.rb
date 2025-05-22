class CreateAlbumsPlayersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :albums, :players, id: false do |t|
      t.index [:album_id, :player_id], unique: true
      t.index [:player_id, :album_id], unique: true
    end

    add_foreign_key :albums_players, :albums, column: :album_id
    add_foreign_key :albums_players, :players, column: :player_id

    reversible do |dir|
      dir.up do
        migrate_album_players_data
      end
    end
  end

  private

  def migrate_album_players_data
    Album.where.not(player_id: nil).find_each do |album|
      execute <<-SQL.squish
        INSERT INTO albums_players (album_id, player_id)
        VALUES (#{album.id}, #{album.player_id})
      SQL
    end
  end
end
