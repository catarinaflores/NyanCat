extends Node

const SAVE_PATH := "user://save.res"

var data := SaveData.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()

func save_data():
	ResourceSaver.save(data, SAVE_PATH)

func load_data():
	if ResourceLoader.exists(SAVE_PATH):
		data = ResourceLoader.load(SAVE_PATH)

