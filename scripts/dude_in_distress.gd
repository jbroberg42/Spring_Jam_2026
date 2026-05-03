extends Area2D

@onready var game_manager: Node = %GameManager


func _on_body_entered(body: Node2D) -> void:
	if GameState.have_macguffin:
		game_manager.load_next_level()
