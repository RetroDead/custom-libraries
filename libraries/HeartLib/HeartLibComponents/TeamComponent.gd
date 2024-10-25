extends Node
class_name HeartLibTeamComponent

enum TEAM {
	Neutral
	Player
	Enemy
}

export(TEAM) var _team : int = TEAM.Neutral

func get_team() -> int:
	return _team

func set_team(team) -> void:
	_team = team

func is_on_same_team(team_conponent : HeartLibTeamComponent) -> bool:
	return get_team() == team_conponent.get_team()
