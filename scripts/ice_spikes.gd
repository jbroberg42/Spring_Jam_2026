extends Node2D
@onready var anim = $AnimatedSprite2D
@onready var game_manager: Node = %GameManager
@onready var collision_shape_2d = $killzone/CollisionShape2D
@onready var timer = $Timer

func _ready():
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)
	
func _on_game_manager_spring() -> void:
	collision_shape_2d.disabled = true
	anim.play("melt")
	
func _on_game_manager_winter() -> void:
	anim.play("freeze")
	timer.start()
	

func _on_timer_timeout():
	collision_shape_2d.disabled = false
