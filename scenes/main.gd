extends Node

@export var rainbows_scene: PackedScene
@export var scroll_speed = 4 


var screen_size: Vector2
var rainbow_row: Array
const RAINBOW_DELAY = 600
const RAINBOW_RANGE = 300
var rainbow_scene = preload("res://scenes/rainbows.tscn")
@onready var cat = %Player
@onready var rainbow_timer = %RainbowTimer
@onready var nyan_cat_music = %NyanCatMusic
@onready var instructions = %Instructions



# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	nyan_cat_music.play()
	await get_tree().create_timer(3).timeout
	instructions.hide()
	new_game()

# func _process(delta):
	# for obstacle in rainbow_row:
		# obstacle.global_position.x -= scroll_speed * delta

func new_game() -> void:
	get_tree().paused = false
	GameManager.score = 0
	generate_rainbows()
	cat.reset()
	rainbow_timer.start()


func _on_rainbow_timer_timeout():
	generate_rainbows()


func generate_rainbows() -> void:
	var obstacle = rainbow_scene.instantiate()
	obstacle.global_position.x = screen_size.x + RAINBOW_DELAY
	obstacle.global_position.y = screen_size.y / 2 + randi_range(-RAINBOW_RANGE, RAINBOW_RANGE)
	add_child(obstacle)
	# rainbow_row.append(obstacle)
	if obstacle.global_position.x < 0:
		queue_free()


func stop_game(delta) -> void:
	rainbow_timer.stop()
	cat.stop(delta)



func cat_hit(delta) -> void:
	stop_game(delta)
