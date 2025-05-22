require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "valid album" do
    album = Album.new(name: albums(:peligro).name, players: [ players(:shakira) ])
    assert album.valid?
    assert_equal album.name, albums(:peligro).name
    assert_includes album.players, players(:shakira)
  end

  test "album can have one player" do
    album = Album.new(name: albums(:fixation).name, players: [ players(:shakira) ])
    assert album.valid?
    assert_equal 1, album.players.size
    assert_includes album.players, players(:shakira)
  end

  test "album can have multiple players" do    
    album = Album.new(name: albums(:confessions).name, players: [ players(:madonna), players(:shakira) ])
    assert album.valid?
    assert_equal 2, album.players.size
    assert_equal [players(:madonna), players(:shakira)], album.players
  end

  test "presence of name" do
    album = Album.new
    assert_not album.valid?
    assert_not_empty album.errors[:name]
  end

  test "presence of players" do
    album = Album.new
    assert_not album.valid?
    assert_not_empty album.errors[:players]
  end
end
