require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require 'pry'

class TeamTest < Minitest::Test

  def test_team_exists
    team = Team.new("France")

    expected = Team
    actual = team
    assert_instance_of expected, actual
  end

  def test_team_has_country
    team = Team.new("France")

    expected = "France"
    actual = team.country
    assert_equal expected, actual
  end

  def test_team_is_not_eliminated_by_default
    team = Team.new("France")

    expected = false
    actual = team.eliminated?
    assert_equal expected, actual
  end

  def test_team_starts_with_no_players
    team = Team.new("France")

    expected = []
    actual = team.players
    assert_equal expected, actual
  end

  def test_team_can_add_players
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    expected = 2
    actual = team.players.length
    assert_equal expected, actual
  end

  def test_players_can_be_accessed_by_position
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    expected = "Paul Pogba"
    actual = team.players_by_position("midfielder")[0].name
    assert_equal expected, actual
  end

  def test_players_can_be_accessed_by_other_positions
    team = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    team.add_player(mbappe)
    team.add_player(pogba)

    expected = []
    actual = team.players_by_position("defender")
    assert_equal expected, actual
  end



end
