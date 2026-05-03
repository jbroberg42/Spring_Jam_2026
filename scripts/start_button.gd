extends Button


func _on_pressed() -> void:
	print("hello")
	get_tree().change_scene_to_file(GameState.LEVEL_LIST[GameState.level])
	GameState.level += 1
