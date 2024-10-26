extends Resource
class_name DEPRICATED_HeartLibLinkContainer

# contains a dictionary of signals (key) and target node types 

export var _signal_links : Dictionary = {}

func set_link(signal_name : String,target_type_and_method : Array) -> void:
	_signal_links[signal_name] = target_type_and_method

func get_signal_links() -> Dictionary:
	return _signal_links

func set_signal_links(signal_links : Dictionary) -> void:
	_signal_links = signal_links
