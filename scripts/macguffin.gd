extends Area2D

@onready var game_manager: Node = %GameManager



func _on_body_entered(body: Node2D) -> void:
	GameState.have_macguffin = true
	queue_free()
