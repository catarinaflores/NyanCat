extends Node2D

signal hit


func _on_top_rainbow_body_entered(body):
	hit.emit()



func _on_bottom_rainbow_body_entered(body):
	hit.emit()
