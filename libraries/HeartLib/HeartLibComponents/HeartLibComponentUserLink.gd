extends Node
class_name HeartLibComponentUserLink

"NOTE : '_use_auto_link_structure' requires the links parent be the component, and the components parent be the user"

export var _use_auto_link_structure : bool = true
export(NodePath) var _user = null
export(NodePath) var _component = null

# by default, 
func _ready():
	if _use_auto_link_structure:
		set_component(get_parent())
		set_user(get_parent().get_parent())

func get_user() -> Node:
	return _user

func set_user(user : Node) -> void:
	_user = user

func get_component() -> Node:
	return _component

func set_component(component) -> void:
	_component = component
