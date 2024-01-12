extends Control

@onready var all_scores = %AllScores
@onready var cat_sound = %CatSound


func _process(_delta):
	all_scores.text = "High Score \n" + str(SaveSystem.data.highscore)


func _on_start_button_pressed():
	cat_sound.play()
	get_tree().change_scene_to_file("res://scenes/main.tscn")



func _on_quit_button_pressed():
	cat_sound.play()
	get_tree().quit()
