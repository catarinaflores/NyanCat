extends Node2D


var speed = 400


func _process(delta):
	if GameManager.game_over == false:
		position.x -= speed * delta
	else:
		speed = 0


func _on_top_rainbow_body_entered(_body):
	GameManager.hit.emit()
	GameManager.game_ends()


func _on_bottom_rainbow_body_entered(_body):
	GameManager.hit.emit()
	GameManager.game_ends()


func _on_scoring_area_body_entered(_body):
	GameManager.scored.emit()

