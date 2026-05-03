extends Node

@onready var game_manager: Node = %GameManager
func _ready():
	game_manager.spring.connect(_on_game_manager_spring)
	game_manager.winter.connect(_on_game_manager_winter)
	
var score: int = 0
var level: int = 0
var time_taken: int = 0
var is_winter: bool = false

const ABILITY_COOLDOWN: int = 1
var ability_ready: bool = true

var have_macguffin: bool = false

var level_list: Array[String] = [
	"res://scenes/game.tscn",
	"res://scenes/level0.tscn"
	]
	
func reset_level():
	get_tree().reload_current_scene()
	have_macguffin = false
	ability_ready = true
	is_winter = false
	
func reset_game():
	score = 0
	level = 0
	is_winter = false
	have_macguffin = false
	ability_ready = true
	get_tree().change_scene_to_file("res://scenes/levels/main_menu.tscn")

func _on_game_manager_spring() -> void:
	is_winter = false
	
func _on_game_manager_winter() -> void:
	is_winter = true
	
