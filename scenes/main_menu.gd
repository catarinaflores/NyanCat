extends Control

@onready var score = %Score
@onready var clicked_sound = %ClickedSound
@onready var main_menu_music = %MainMenuMusic


func _ready():
	main_menu_music.play()

func _process(_delta):
	score.text = "High Score \n" + str(SaveSystem.data.highscore)


func _on_start_button_pressed():
	clicked_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")



func _on_quit_button_pressed():
	clicked_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
