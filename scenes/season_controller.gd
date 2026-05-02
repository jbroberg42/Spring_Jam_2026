extends Control


func _on_game_manager_spring() -> void:
	$AnimatedSprite2D.play("spring")
func _on_game_manager_winter() -> void:
	$AnimatedSprite2D.play("winter")
