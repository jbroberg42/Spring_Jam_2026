extends Node2D
@onready var anim = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager

func _ready():
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)
	anim.play("melted")
	
func _on_game_manager_spring() -> void:
	anim.play("melt")
	
func _on_game_manager_winter() -> void:
	anim.play("freeze")
