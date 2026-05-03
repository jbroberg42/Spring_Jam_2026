extends Node2D

@onready var snow = $FogParallax2D2/Snow
@onready var game_manager: Node = %GameManager
@onready var petals = $FogParallax2D3/Petals

func _ready():
	# connect signals with code.  Otherwise you have to connect each mob manually.  Which sucks.
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)

	
	# hide if starting winter, show if starting spring
	if GameState.is_winter:
		_on_game_manager_winter()
	else:
		_on_game_manager_spring()

func _on_game_manager_winter() -> void:
	snow.emitting = true
	snow.lifetime = 10
	petals.emitting = false
	petals.lifetime = 1
	print("fall")
	
func _on_game_manager_spring() -> void:
	snow.emitting = false
	snow.lifetime = 1
	petals.emitting = true
	petals.lifetime = 10
	print("spring")
	
