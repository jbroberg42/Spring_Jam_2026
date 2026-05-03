extends Control

func _on_ready():
	$Label.text = ""


func _on_game_manager_spring() -> void:
	$AnimatedSprite2D.play("spring")
	cooldown_label()
func _on_game_manager_winter() -> void:
	$AnimatedSprite2D.play("winter")
	cooldown_label()
	
func cooldown_label():
	var a: int = GameState.ABILITY_COOLDOWN
	for i in a:
		$Label.text = str(a)
		a -= 1
		await get_tree().create_timer(1).timeout
		
	$Label.text = ""
	
