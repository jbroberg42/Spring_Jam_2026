extends Area2D

@onready var game_manager: Node = %GameManager

func _ready():

	#connect signals with code.  Otherwise you have to connect each mob manually.  Which sucks.
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)
	
	if GameState.is_winter:
		_on_game_manager_winter()
	else:
		_on_game_manager_spring()
	

func _on_game_manager_spring() -> void:
	$killzone/CollisionShape2D.disabled = false
	$AnimatedSprite2D.play("melting")
	$Timer.start()
		
func _on_game_manager_winter() -> void:
	$killzone/CollisionShape2D.disabled = true
	$AnimatedSprite2D.play("freezing")

func _on_timer_timeout() -> void:
	if !GameState.is_winter:
		$AnimatedSprite2D.play("flowing")
