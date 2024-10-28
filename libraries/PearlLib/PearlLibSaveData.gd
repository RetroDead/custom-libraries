extends Resource
class_name PearlLibSaveData

"NOTE : Add values to be saved"

const SAVE_PATH = "user://save_data.tres"

export var data : Dictionary = {}


# -------- set data

# The variable 'key' is not statically type, as it can be anything
# The variable 'value' is not statically type, as it can be anything

func set_value(key,value) -> void:
	data[key] = value

func get_value(key): # does not have a return type, because the values retrieved could be any type..
	if data.has(key): return data[key]

# -------- data manipulations

# here you would set keys in data to be saved
func _write_to_save_data() -> void:
	return

# here you would set any variables that were loaded
func _read_from_save_data(loaded_data : PearlLibSaveData) -> void:
	data = loaded_data.data
	return

# define initial data here to load it
func load_initial_data() -> void:
	return

# -------- read/write

func save_game_data() -> void:
	_write_to_save_data()
	ResourceSaver.save(SAVE_PATH,self,ResourceSaver.FLAG_BUNDLE_RESOURCES)

func load_save_data() -> void:
	if ResourceLoader.exists(SAVE_PATH):
		var _loaded_data : PearlLibSaveData = ResourceLoader.load(SAVE_PATH)
		_read_from_save_data(_loaded_data)
