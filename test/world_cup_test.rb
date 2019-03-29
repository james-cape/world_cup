require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'pry'

class WorldCupTest < Minitest::Test

  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_world_cup_exists
    expected = WorldCup
    actual = @world_cup
    assert_instance_of expected, actual
  end

  def test_world_cup_has_a_year
    expected = 2018
    actual = @world_cup.year
    assert_equal expected, actual
  end

  def test_world_cup_has_teams
    expected = 2
    actual = @world_cup.teams.length
    assert_equal expected, actual
  end

  def test_accessing_active_players_by_position

    expected = 2
    actual = @world_cup.active_players_by_position("midfielder").length
    assert_equal expected, actual
  end

  def test_accessing_active_players_by_position_after_one_elimination
    @croatia.eliminated = true

    expected = 1
    actual = @world_cup.active_players_by_position("midfielder").length
    assert_equal expected, actual
  end

  def test_all_players_by_position

    expected = 3
    actual = @world_cup.all_players_by_position.length
    assert_equal expected, actual
  end


end
