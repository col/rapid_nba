defmodule RapidNba do
  use Tesla
  adapter Tesla.Adapter.Hackney
  alias RapidNba.String, as: String

  plug Tesla.Middleware.BaseUrl, "https://api-nba-v1.p.rapidapi.com"
  plug Tesla.Middleware.Headers, [
    {"X-RapidAPI-Host", "api-nba-v1.p.rapidapi.com"},
    {"X-RapidAPI-Key", Application.get_env(:rapid_nba, :api_key)},
  ]
  plug Tesla.Middleware.JSON

  def all_seasons() do
    get("/seasons/")
  end

  def all_leagues() do
    get("/leagues/")
  end

  def all_teams(league \\ "standard") do
    teams_by(league: league)
  end

  @team_filters [:team_id, :league, :city, :short_name, :nick_name, :conf_name, :div_name]
  def teams_by([{filter_key, _}] = filter) when filter_key in @team_filters do
    get("/teams/#{filter_path(filter)}")
  end

  def get_team(team_id) do
    teams_by(teamId: team_id)
  end

  def all_players(league \\ "standard") do
    players_by(league: league)
  end

  @player_filters [:player_id, :team_id, :league, :country, :last_name, :first_name]
  def players_by([{filter_key, _}] = filter) when filter_key in @player_filters do
    get("/players/#{filter_path(filter)}")
  end

  def get_player(player_id) do
    players_by(playerId: player_id)
  end

  @game_filters [:season_year, :league, :game_id, :team_id, :date, :live]
  def games_by([{filter_key, _}] = filter) when filter_key in @game_filters do
    get("/games/#{filter_path(filter)}")
  end

  def game_details(game_id) do
    get("/gameDetails/#{to_string(game_id)}")
  end

  @standings_filters [:conference, :division, :team_id]
  def standings(season, league \\ "standard", filter \\ [])

  def standings(season, league, [{filter_key, _}] = filter) when filter_key in @standings_filters do
    get("/standings/#{to_string(league)}/#{to_string(season)}/#{filter_path(filter)}")
  end

  def standings(season, league, _) do
    get("/standings/#{to_string(league)}/#{to_string(season)}")
  end

  @player_stat_filters [:game_id, :player_id]
  def player_stats([{filter_key, _}] = filter) when filter_key in @player_stat_filters do
    get("/statistics/players/#{filter_path(filter)}")
  end

  def game_stats(game_id) do
    get("/statistics/games/#{to_string(game_id)}")
  end

  defp filter_path([{filter_key, filter_value}]) do
    "#{String.camelize(filter_key)}/#{to_string(filter_value)}"
  end
end
