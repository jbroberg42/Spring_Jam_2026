extends Button



func _on_pressed() -> void:
	print("quit")
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	SceneTree.quit
