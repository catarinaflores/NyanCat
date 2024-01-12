extends CanvasLayer

@onready var all_scores = %AllScores
@onready var clicked_sound = %ClickedSound

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	all_scores.text = "Your Score \n" + str(GameManager.score) + " \n " + "High Score \n" + str(SaveSystem.data.highscore)



func _on_replay_button_pressed():
	clicked_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().reload_current_scene()




func _on_quit_button_pressed():
	clicked_sound.play()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
