class WorldCup

  attr_reader :year, :teams
  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    teams_in_play = @teams.find_all do |team|
      !team.eliminated?
    end

    teams_in_play.map do |team|
      team.players.find_all do |player|
        player.position == position
      end
    end
  end

  def all_players_by_position

    all_positions = teams.map do |team|
      team.players.map do |player|
        player.position
      end
    end.flatten.uniq

    by_position = {}

    all_positions.each do |position|
      by_position[position] = active_players_by_position(position)
    end
    by_position
  end
  

end
