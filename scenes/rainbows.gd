extends Node2D



func _process(delta):
	position.x -= GameManager.speed * delta


func _on_top_rainbow_body_entered(body):
	GameManager.hit.emit()
	GameManager.game_ends()


func _on_bottom_rainbow_body_entered(body):
	GameManager.hit.emit()
	GameManager.game_ends()


func _on_scoring_area_body_entered(body):
	GameManager.scored.emit()

