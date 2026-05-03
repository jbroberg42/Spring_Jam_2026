extends Area2D

@onready var game_manager: Node = %GameManager

func _ready():
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)

func _on_body_entered(body: Node2D) -> void:
	GameState.have_macguffin = true
	queue_free()

func _on_game_manager_spring() -> void:
	show()
	$CollisionShape2D.disabled = false
	
func _on_game_manager_winter() -> void:
	hide()
	$CollisionShape2D.disabled = true
