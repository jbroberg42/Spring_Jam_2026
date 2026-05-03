extends Control

var colors: Array[String] = GameState.LEVEL_COLORS

func _process(delta: float) -> void:
	if GameState.have_macguffin:
		$AnimatedSprite2D.play(colors[GameState.level - 1])
		$AnimatedSprite2D.show()
	else:
		$AnimatedSprite2D.hide()
	
	
