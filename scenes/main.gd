extends Node

@export var rainbows_scene : PackedScene

var game_running: bool
var game_over: bool
var screen_size: Vector2
var rainbow_row: Array
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
	rainbow_row.clear()
	GameManager.score = 0
	generate_rainbows()
	cat.reset()

func _input(event) -> void:
	if game_over== false:
		if Input.is_action_just_pressed("fly"):
			if game_running == false:
				game_running = true


func _on_rainbow_timer_timeout():
	generate_rainbows()


func generate_rainbows() -> void:
	var obstacle = rainbows_scene.instantiate()
	obstacle.position.x = screen_size.x + RAINBOW_DELAY
	obstacle.position.y = screen_size.y / 2 + randi_range(-RAINBOW_RANGE, RAINBOW_RANGE)
	obstacle.hit.connect(cat_hit)
	add_child(obstacle)
	rainbow_row.append(obstacle)


func cat_hit() -> void:
	pass
