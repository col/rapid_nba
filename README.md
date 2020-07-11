# RapidNba

A thin elixir client for [API NBA](https://rapidapi.com/api-sports/api/api-nba?endpoint=5bb76fffe4b02d6cfa6a8128) on Rapid API. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `rapid_nba` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:rapid_nba, "~> 0.1.0"}
  ]
end
```

## Configuration

Add your Rapid API Key to your config.

```
config :rapid_nba, :api_key, "xxx"
```

## Usage

```
iex> RapidNba.all_teams()
{:ok,
 %Tesla.Env{
   body: %{
     "api" => %{
       ...
       "results" => 54,
       "status" => 200,
       "teams" => [
         %{
           "allStar" => "0",
           "city" => "Atlanta",
           "fullName" => "Atlanta Hawks",
           "leagues" => %{
             "standard" => %{"confName" => "East", "divName" => "Southeast"}
           },
           "logo" => "https://upload.wikimedia.org/wikipedia/fr/e/ee/Hawks_2016.png",
           "nbaFranchise" => "1",
           "nickname" => "Hawks",
           "shortName" => "ATL",
           "teamId" => "1"
         },
         ...
       ]
     }
   }
 }
}
```

## APIs

- all_seasons
- all_leagues
- all_teams
- teams_by
- get_team
- all_players
- players_by
- get_player
- games_by
- game_details
- standings
- player_stats
- game_stats

See hex docs for more info.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/rapid_nba](https://hexdocs.pm/rapid_nba).

