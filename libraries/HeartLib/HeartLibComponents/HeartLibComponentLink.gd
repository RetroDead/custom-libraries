extends Node
class_name HeartLibComponentLink

"NOTE : '_use_auto_link_structure' requires the links parent be the component, and the components parent be the user"

"""

IDEA : 

"""

#export var _use_auto_link_structure : bool = true
#export(NodePath) var _user = null
#export(NodePath) var _component = null

#"""
#
#The ComponentLink searches through its children for a method called get_link()
#	get_link() returns the components Link object. The Link object has a list of all connections a 
#	node should have for its signals
#
#	example
#	var _links : Dictionary = {
#		"on_hurt" : HeartLibHealthComponent
#	}
#
#"""

func _ready():
#	if _use_auto_link_structure:
#		set_component(get_parent())
#		set_user(get_parent().get_parent())
	_link_signals()

func return_component(component_type) -> void:
	var _children : Array = get_parent().get_children()
	for i in _children:
		if i is HeartLibHurtbox:
			print("hurtbox found")

func _link_signals():
	pass
#	var hurtbox = get_node("../hurtbox")
#	var team_component = $TeamComponent
#	var destruction_component = $DestructionComponent
#	var	health_component = get_node("HealthComponent")
#
#	for i in hurtbox.get_property_list():
#		if i.has("name") and i["name"] == "TestVar":
#			print("found test var!")
#			return
	
	# tried using links... did not work
#	var children : Array = get_children()
#	for i in children:
#		print(i)
#		if i.has_method("get_link"):
#			print("link...")
#			var _link : DEPRICATED_HeartLibLinkContainer= i.get_link()
#			var _signal_links = _link.get_signal_links()
#			print(_signal_links)
#			for s in _signal_links:
#				print(s)
	
#	if _is_valid(hurtbox) and _is_valid(health_component):
#		hurtbox.connect("on_hurt",health_component,"take_damage")

func _is_valid(node : Node) -> bool:
	return node != null and is_instance_valid(node)

#func get_user() -> Node:
#	return _user
#
#func set_user(user : Node) -> void:
#	_user = user
#
#func get_component() -> Node:
#	return _component
#
#func set_component(component) -> void:
#	_component = component
