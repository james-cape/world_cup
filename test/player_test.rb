require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test


  def test_player_exists
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    expected = Player
    actual   = player
    assert_instance_of expected, actual
  end

  def test_player_has_a_name
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    expected = "Luka Modric"
    actual   = player.name
    assert_equal expected, actual
  end

  def test_player_has_a_position
    player = Player.new({name: "Luka Modric", position: "midfielder"})

    expected = "midfielder"
    actual   = player.position
    assert_equal expected, actual
  end
end
