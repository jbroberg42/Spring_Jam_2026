extends Node2D

@onready var game_manager: Node = %GameManager

const SEASON_TEXTURES = [
	"res://assets/sprites/WinterTileSet.png",
	"res://assets/sprites/SpringTileSet.png"
]

#func _ready() -> void:
	##game_manager.spring.connect(_on_game_manager_spring)
	##game_manager.winter.connect(_on_game_manager_winter)
	#if GameState.is_winter:
		#_on_game_manager_winter()
	#else:
		#_on_game_manager_spring()



#func _on_game_manager_winter() -> void:
	#$".".tile_set.get_source(1).texture = preload("res://assets/sprites/WinterTileSet.png")
#func _on_game_manager_spring() -> void:
	#$".".tile_set.tile_set_texture = SEASON_TEXTURES[1]
