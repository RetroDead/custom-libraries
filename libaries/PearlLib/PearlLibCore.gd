extends Node
class_name PearlLibCore

var this_save_data  = null
const SAVE_PATH = "user://save_data.tres"

# add multiple save files :praying:

# checks to see if a save file exists. if so, it loads it. if not, a new one is created
func init_save_file() -> void:
	if not ResourceLoader.exists(SAVE_PATH):
		var _new_save_data = load("res://libaries/PearlLib/save_data.tres")
		_new_save_data.set_path(SAVE_PATH)
		_new_save_data.load_initial_data()
		_new_save_data.save_game_data()
		this_save_data = _new_save_data
	else:
		this_save_data = load(SAVE_PATH)

# saves data if a save file exists
func save_data() -> void:
	if not _has_save_data(): return
	this_save_data.save_game_data()

# loads data if a save file exists
func load_data() -> void:
	if _has_save_data():
		this_save_data.load_save_data()

# initializes data if a save file exists
func delete_data() -> void:
	if not _has_save_data(): return
	this_save_data.load_initial_data() 

# returns the save file
func get_save_file() -> PearlLibSaveData:
	if _has_save_data(): return this_save_data
	print("SAVE DOES NOT EXIST. RETURNING NEW FILE")
	return PearlLibSaveData.new()

# returns true or false if there is a save file present or not
func _has_save_data() -> bool:
	return this_save_data != null
