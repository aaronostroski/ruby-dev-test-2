require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test "valid player" do
    player = Player.new(name: players(:madonna).name)
    assert player.valid?
  end

  test "player can have one album" do
    player = Player.new(name: players(:shakira).name, albums: [ albums(:peligro) ])
    assert_equal 1, player.albums.size
    assert_includes player.albums, albums(:peligro)
  end

  test "player can have multiple albums" do            []    
    player = Player.new(name: players(:shakira).name, albums: [ albums(:confessions), albums(:peligro) ])
    assert_equal 2, player.albums.size
    assert_includes player.albums, albums(:confessions)
    assert_includes player.albums, albums(:peligro)
  end

  test "not necessarily a player must have an album" do
    player = Player.new(name: players(:madonna).name)
    assert player.valid?
    assert_equal 0, player.albums.size
  end

  test "presence of name" do
    player = Player.new
    assert_not player.valid?
    assert_not_empty player.errors[:name]
  end
end
