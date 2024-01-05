extends Node

var game_running: bool
var game_over: bool
var screen_size: Vector2
var rainbows: Array
const RAINBOW_DELAY: int = 100
const RAINBOW_RANGE: int = 200
@onready var cat = %Player



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	new_game()

func new_game() -> void:
	game_running = false
	game_over = false
	GameManager.score = 0
	cat.reset()

func _input(event) -> void:
	if game_over== false:
		if Input.is_action_just_pressed("fly"):
			if game_running == false:
				game_running = true



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
