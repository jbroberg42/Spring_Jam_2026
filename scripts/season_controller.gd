extends Control
#@onready var game_manager: Node = %GameManager

func _on_ready():
	$Label.text = ""
	#game_manager.spring.connect(_on_game_manager_spring)
	#game_manager.winter.connect(_on_game_manager_winter)

func _process(delta: float) -> void:
	if !GameState.ability_ready:
		if $Timer.is_stopped():
			$Timer.start()
		$Label.text = str(int($Timer.time_left+1))
	elif $Timer.time_left < 1:
		$Label.text = ""
		
	if GameState.is_winter:
		$AnimatedSprite2D.play("winter")
	else:
		$AnimatedSprite2D.play("spring")

#func _on_game_manager_spring() -> void:
	#$AnimatedSprite2D.play("spring")
	#$Timer.start()
#func _on_game_manager_winter() -> void:
	#$AnimatedSprite2D.play("winter")
	#$Timer.start()
	
#func cooldown_label():
	#var a: int = GameState.ABILITY_COOLDOWN
	#for i in a:
		#$Label.text = str(a)
		#a -= 1
		#await $Timer.timeout
		#
	#$Label.text = ""
	
