extends Button


func _on_pressed() -> void:
	print("hello")
	get_tree().change_scene_to_file(GameState.LEVEL_LIST[GameState.level + 1])
	GameState.level += 1
